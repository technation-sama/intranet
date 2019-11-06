class MteamMailer < ApplicationMailer
    default from: 'questions@samadc.org'
    def new_mteam_mailer(question)
    @question = question
      mail( :to => ENV['GMAIL_USERNAME'],
            :subject => @question.title
      )
  end
end
