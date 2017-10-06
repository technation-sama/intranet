class SuggestionMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.suggestion_mailer.new_suggestion.subject
  #
  def new_suggestion()
    #@suggestion = suggestion


      mail( :from => "ndwigajustin@gmail.com",
            :to => "ndwigajustin@gmail.com",
            :subject => 'Thanks for signing up for our amazing app'
      )
  end
end
