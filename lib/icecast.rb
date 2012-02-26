require 'timeout'

class Icecast

    def get_data (counter, logger)
    
        logger.debug "get_data called, counter is #{counter}"
        
        #http://66.232.113.200:8042/admin/stats.xml
        url = '96.31.83.86'
        port = '8042'
        password = 'dusty;0909'

        icecastTitle = nil listeners = nil trackId = nil isMixWithCounter = false mixId = nil resetCounter = false

        begin
            Timeout::timeout(10) do
                Net::HTTP.start(url,port) {|http|

                    req = Net::HTTP::Get.new('/admin/stats.xml')
                    req.basic_auth 'admin', password
                    response = http.request(req)

                    doc = REXML::Document.new response.body
                    source = nil
                    icecastTitleLive = nil
                    icecastTitleBackup = nil
                    # server: /live, /autodj; nicecast: /listen
                    doc.root.elements.each('source') do |nextElement|
                        source = nextElement.attributes['mount']
                        titleElement = nextElement.elements['title']
                        logger.debug "Found source element with mount attribute #{source}"
                        if titleElement == nil
                            logger.debug "No title found for #{source}, skipping"
                            next
                        else
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
                      displayInfo = DisplayInfo.find(:first, :conditions => {:icecast_title => icecastTitleLive})
                      if displayInfo == nil
                        logger.warn "Track not found: #{icecastTitleLive}, listeners = #{listeners} #{Time.new}"
                      else
                        trackId = displayInfo.track_id
                      end    

                    else
                      icecastTitle = icecastTitleBackup
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
                          mixLength = mixInfo.length
                          mixTime = counter * 30
                          if mixTime > mixLength
                            mixTime = 30
                            resetCounter = true
                          end
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

                    if trackId == nil
                        PlayInfo.create({:icecast_title => icecastTitle, :mix_id => mixId, :listeners => listeners})  
                    else
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
