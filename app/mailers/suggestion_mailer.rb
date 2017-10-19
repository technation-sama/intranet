class SuggestionMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.suggestion_mailer.new_suggestion.subject
  #
  def new_suggestion(suggestion)
    @suggestion = suggestion
      mail( :from => "eric.miriti@nbo.samadc.org",
            :to => "eric.miriti@nbo.samadc.org",
            :subject => @suggestion.subject
      )
  end
end
