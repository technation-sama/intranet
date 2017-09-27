require 'test_helper'

class SuggestionMailerTest < ActionMailer::TestCase
  test "new_suggestion" do
    mail = SuggestionMailer.new_suggestion
    assert_equal "New suggestion", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
