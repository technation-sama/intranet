class SuggestionMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.suggestion_mailer.new_suggestion.subject
  #
  def new_suggestion
    @greeting = "Hi Admin"

    mail to: "justin.ndwiga@nbo.samadc.org"
  end
end
