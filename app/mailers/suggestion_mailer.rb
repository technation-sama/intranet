class SuggestionMailer < ActionMailer::Base
  default from: "employee@nbo.samdc.org"
  def new_suggestion
    mail(to:"ndwigajustin@gmail.com",
      #from:"justin.ndwiga@nbo.samadc.org",
      subject:"New Suggestion",
      body: "Please Review"
    )
  end
end
