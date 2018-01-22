class PollMailer < ApplicationMailer

	def open_poll_email(period)
    	@users = User.all
    	#@url  = 'http://example.com/login'
    	@users.each do |user|
           send_mail(period, user).deliver_later
        end
    end

    def send_mail(period,recipient)
    	@user = recipient
    	mail(:to => @user.email,
            :subject =>'Employee of the Month Nomination'
        )
    end
end
