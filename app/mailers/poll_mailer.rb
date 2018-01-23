class PollMailer < ApplicationMailer
    
  def open_poll_email(period)
    	@users = User.all
    	@users.each do |user|
           send_mail(period, user)
        end
    end

    def send_mail(period,recipient)
    	@user = recipient
    	@periodd =period
    	mail(:to => @user.email,
            :subject =>'Employee of the Month Nomination'
        )
    end
    
end
