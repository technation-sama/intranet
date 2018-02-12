class PollMailer < ApplicationMailer
  def open_poll_email(period)
    @periodd =period
    mail(:to => "eric.miriti@nbo.samadc.org",
        :subject =>'Employee of the Month Nomination'
    )
  end
end
