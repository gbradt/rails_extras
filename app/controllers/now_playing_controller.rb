class NowPlayingController < ApplicationController

    def index
    
        lastRefresh = nil
        currentInfo = CurrentInfo.find(:first)
        if currentInfo != nil
            lastRefresh = currentInfo.last_refresh
        end
        logger.info "lastRefresh = #{lastRefresh}, 30 seconds ago was #{Time.now.ago(30)}"
        
        if lastRefresh == nil || lastRefresh < Time.now.ago(30)
            playInfo = PlayInfo.find(:last)
            if playInfo == nil || playInfo.created_at < Time.now.ago(60)
                message = "#{Time.new} Last entry in play info table is missing or over a minute old!"
                logger.warn message
                if playInfo != nil
                    logger.warn "playInfo.created_at = #{playInfo.created_at}"
                end                
                if currentInfo.error_notified == false
                    ErrorMailer.deliver_error_email message
                    currentInfo.update_attribute('error_notified', true)            
                else
                    logger.info "e-mail sent."
                end

                @listeners = nil
                @mix = nil
                @artist = nil
                @title = nil
                @year = nil

            else
                # The data in CurrentInfo is more than 30 seconds old, so update it. 
                @listeners = playInfo.listeners
                @mix = nil
                mixId = playInfo.mix_id
                trackId = playInfo.track_id
                # I only need the separate mix name if there's a track ID, otherwise the icecast
                # title (which is the name of the mix) will be displayed.
                if mixId != nil && trackId != nil
                    mixInfo = Mix.find(:first, :conditions => {:mix_id => mixId})
                    @mix = mixInfo.icecast_title
                end
        
                # Handle no track ID
                if trackId == nil
                    # It might be a segment, PSA, etc.
                    testTitle = playInfo.icecast_title
                    # Don't ignore a mix title, that should be displayed normally.
                    if testTitle.match(/^Between Two Islands/) != nil && mixId == nil
                        # Display the info from the last song before the break
                        @artist = currentInfo.artist
                        @year = currentInfo.year
                        @title = currentInfo.title
                        logger.info "no track ID, found a B2I track: #{testTitle}"
                    else
                        # get info from icecast_title
                        @title = testTitle
                        logger.info "no track ID, using icecast_title: #{@title}"
                    end
                else            
                    logger.info "found play info track ID #{trackId}"
                    # The DisplayInfo table has extended song information such as long title, year, etc.
                    displayInfo = DisplayInfo.find(:first, :conditions => {:track_id => trackId})
                    @artist = displayInfo.artist
                    @year = displayInfo.year
                    @title = displayInfo.title
                end
  
                updated = {'listeners' => @listeners, 'mix_icecast_title' => @mix, 'artist' => @artist, 'title' => @title, 'year' => @year, 
                    'last_refresh' => Time.now, 'error_notified' => false}
                if currentInfo != nil
                    currentInfo.update_attributes(updated)            
                else
                    CurrentInfo.create(updated)
                end
            end
            
        else
            # The data in CurrentInfo is less than 30 seconds old, so we can display it. 
            @listeners = currentInfo.listeners
            @mix = currentInfo.mix_icecast_title
            @artist = currentInfo.artist
            @title = currentInfo.title
            @year = currentInfo.year
                    
        end        
    end
    
    # This is for manually setting the mix counter. This is done to set the current location within
    # a mix when it is playing as the backup music source. (Unfortunately, when a mix starts for
    # backup purposes, it is not guaranteed to start from the beginning.)
    def set_mix_counter
    
        counterParam = params[:mixCounter]
        logger.info "counterParam is #{counterParam}"
        worker = MiddleMan.worker(:get_info_worker)
        # This is how to call a method on the running backroundrb process.
        worker.async_set_mix_counter(:arg => counterParam.to_i)
    
    end

end
