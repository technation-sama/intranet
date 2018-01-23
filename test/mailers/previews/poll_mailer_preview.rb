# Preview all emails at http://localhost:3000/rails/mailers/poll_mailer
class PollMailerPreview < ActionMailer::Preview
  def open_poll_email
    poll_month = 1.month.ago.strftime("%B") << " "<< 1.month.ago.strftime("%Y")
    PollMailer.open_poll_email(poll_month)
  end
end
