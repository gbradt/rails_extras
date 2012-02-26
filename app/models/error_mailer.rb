class ErrorMailer < ActionMailer::Base

    def error_email message
        
        recipients "gbradt@mac.com"
        from "george@betweentwoislands.com"
        subject "Error from Rails app"
        sent_on Time.now
        body "#{message}"

#now_playing_controller got a blank title from get_info_worker.
    end  

end
