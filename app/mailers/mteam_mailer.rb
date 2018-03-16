class MteamMailer < ApplicationMailer
    def new_mteam_mailer(question)
    @question = question
      mail( :to => "intranet@nbo.samadc.org",
            :subject => @question.title
      )
  end
end
