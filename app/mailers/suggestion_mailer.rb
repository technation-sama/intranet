class SuggestionMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.suggestion_mailer.new_suggestion.subject
  #
  default from: 'suggestions@samadc.org'
  def new_suggestion(suggestion)
    @suggestion = suggestion
      mail( :to => ENV['GMAIL_USERNAME'],
            :subject => @suggestion.subject
      )
  end
end
