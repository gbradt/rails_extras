require 'icecast.rb'

class GetInfoWorker < BackgrounDRb::MetaWorker
    
    set_worker_name :get_info_worker

    def create(args = nil)
        logger.debug "worker is created"
        cache['mixCounter'] = -1
        cache['updateMixCounter'] = -1
        add_periodic_timer(30) {
            get_info
        }
    end

    def set_mix_counter (counter)
        logger.info "set_mix_counter called, param is #{counter}"
        cache['updateMixCounter'] = counter
    end
    
    def get_info
    
        logger.debug "called get_info"
        if cache['updateMixCounter'] > 0
            cache['mixCounter'] = cache['updateMixCounter']
            cache['updateMixCounter'] = -1
        end
        icecast = Icecast.new
        icecastData = icecast.get_data(cache['mixCounter'], logger)
        
        # This means a mix is playing AND there's a valid counter to keep track of the song.
        if icecastData[0] == true
            cache['mixCounter'] += 1
        else
            cache['mixCounter'] = -1
        end
        
        if icecastData[1] == true
            logger.info "mix wrapped around to the beginning, resetting counter."
            cache['mixCounter'] = 2
        end
        
    end

end

