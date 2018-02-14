class PollMailer < ApplicationMailer
  def open_poll_email(period)
    @periodd =period
    mail(:to => "samadcstaffss@nbo.samadc.org",
        :subject =>'Employee of the Month Nomination'
    )
  end
end
