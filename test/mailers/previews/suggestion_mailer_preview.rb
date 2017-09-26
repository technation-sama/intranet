# Preview all emails at http://localhost:3000/rails/mailers/suggestion_mailer
class SuggestionMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/suggestion_mailer/new_suggestion
  def new_suggestion
    SuggestionMailer.new_suggestion
  end

end
