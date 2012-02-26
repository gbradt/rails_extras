require 'icecast.rb'
require 'loader.rb'

class TesterController < ApplicationController

    def index

    end

    def load_data
    
        loader = Loader.new
        loader.load_songs
    
    end
    
    def retrieve_data
                
        #@rows = MixSong.find(:all)
        @rows = PlayInfo.find(:all, :limit => 360, :order => "created_at DESC")
    
    end

    def get_info
        
        icecast = Icecast.new
        returnArray = icecast.get_data(11, logger)
        @isMix = returnArray[0]
        @playInfo = PlayInfo.find(:last)

    end

end
