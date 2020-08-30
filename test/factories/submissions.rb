include ActionDispatch::TestProcess

FactoryBot.define do
  factory :submission do
    association :challenge
    association :user
    date_completed { nil }
    content { fixture_file_upload("test/sets/submission_content/smile.jpg", "image/jpg") }
    caption { "no caption" }
  end
end
