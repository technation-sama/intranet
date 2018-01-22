class PollMailer < ApplicationMailer
	def open_poll_email
    	@users = User.all
    	#@url  = 'http://example.com/login'
    	@users.each do |user|
           send_mail(user.email, user).deliver_later
        end
  end
  def send_mail(email,recipient)
  	@user = recipient
     mail(to: @user.email, subject: 'XXX 2018 Employee of the Month Nomination')
   end
end
