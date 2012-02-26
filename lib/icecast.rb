require 'timeout'

class Icecast

    def get_data (counter, logger)
    
        logger.debug "get_data called, counter is #{counter}"
        
        #http://96.31.83.86:8042/admin/stats.xml
        url = '96.31.83.86'
        port = '8042'
        password = 'xxxx'

        icecastTitle = nil listeners = nil trackId = nil isMixWithCounter = false mixId = nil resetCounter = false

        begin
            Timeout::timeout(10) do
                Net::HTTP.start(url,port) {|http|

                    req = Net::HTTP::Get.new('/admin/stats.xml')
                    req.basic_auth 'admin', password
                    response = http.request(req)

                    # Parse the XML from the Icecast server.
                    doc = REXML::Document.new response.body
                    source = nil
                    icecastTitleLive = nil
                    icecastTitleBackup = nil
                    # The "mount" attribute can be either /live, which is the normal stream,
                    # or /autodj, which means the backup stream is playing.
                    doc.root.elements.each('source') do |nextElement|
                        source = nextElement.attributes['mount']
                        titleElement = nextElement.elements['title']
                        logger.debug "Found source element with mount attribute #{source}"
                        if titleElement == nil
                            logger.debug "No title found for #{source}, skipping"
                            next
                        else
                            # This is the number of listeners currently connected.
                            listeners = nextElement.elements['listeners'].text
                            if source == '/live'
                              icecastTitleLive = titleElement.text
                            elsif source == '/autodj'
                              icecastTitleBackup = titleElement.text
                            end
                          end
                    end

                    if source == nil
                        logger.warn "No source element found in stats.xml!"
                    end
                    
                    logger.info "Live title is #{icecastTitleLive}, backup title is #{icecastTitleBackup} at #{Time.new}"

                    if icecastTitleLive != nil
                      icecastTitle = icecastTitleLive
                      isMixWithCounter = false
                      # Look up the song currently playing using the title from the XML file.
                      displayInfo = DisplayInfo.find(:first, :conditions => {:icecast_title => icecastTitleLive})
                      if displayInfo == nil
                        logger.warn "Track not found: #{icecastTitleLive}, listeners = #{listeners} #{Time.new}"
                      else
                        trackId = displayInfo.track_id
                      end    

                    else
                      icecastTitle = icecastTitleBackup
                      # Look up the mix currently playing using the title from the XML file.
                      mixInfo = Mix.find(:first, :conditions => {:icecast_title => icecastTitleBackup})
                      if mixInfo == nil
                        logger.warn "Mix not found: #{icecastTitleBackup}, listeners = #{listeners} #{Time.new}"
                      else
                        mixId = mixInfo.mix_id
                        logger.info "Found mix ID #{mixId} at #{Time.new}"
                                  end
                        
                      # Counter default is -1, it will only have a value if I set it manually. Otherwise
                      # the title will just be the mix title with no song info.
                      if counter > 0
                        isMixWithCounter = true
                        if mixInfo != nil
                          logger.info "Getting mix song with counter #{counter} at #{Time.new}"
                          # This is the total length of the mix, in seconds.
                          mixLength = mixInfo.length
                          # The counter uses 30 second increments. So if the counter is 50, we
                          # are 25 minutes (1500 seconds) into the mix.
                          mixTime = counter * 30
                          # If we've passed the end of the mix, wrap around to the beginning.
                          if mixTime > mixLength
                            mixTime = 30
                            resetCounter = true
                          end
                          # Look up the current song using the mix ID and the number of seconds
                          # from the beginning of the mix.
                          songInfo = MixSong.find(:first, :conditions => 
                            "mix_id = #{mixId} AND start <= #{mixTime} AND end >= #{mixTime}")
                
                          if songInfo == nil
                            logger.warn "Mix song not found: mix ID = #{mixId}, mix time = #{mixTime}, listeners = #{listeners} #{Time.new}"
                          else
                            trackId = songInfo.track_id
                          end                                
                        end
                      else
                          isMixWithCounter = false
                      end
                    end                        

                    # Store the current song information and the number of listeners.
                    if trackId == nil
                        # If we haven't managed to find a track ID, just store whatever title was in the XML file.
                        PlayInfo.create({:icecast_title => icecastTitle, :mix_id => mixId, :listeners => listeners})  
                    else
                        # If we got a track ID, store that.
                        PlayInfo.create({:track_id => trackId, :mix_id => mixId, :listeners => listeners})  
                    end
                }
            end
        
          rescue Timeout::Error => err1
            logger.warn "#{Time.new} Timeout when retrieving data from stream server:"
            logger.warn "#{err1} #{err1.backtrace}"
          rescue => err2
            logger.warn "#{Time.new} Error retrieving data from stream server:"
            logger.warn "#{err2} #{err2.backtrace}"
        
        end

        logger.info "#{Time.new}: icecastTitle=#{icecastTitle}, listeners=#{listeners}, trackId=#{trackId}, isMixWithCounter=#{isMixWithCounter}, mixId=#{mixId}, resetCounter=#{resetCounter}"
        return [isMixWithCounter, resetCounter]

    end

end
