FactoryBot.define do
  factory :submission do
    association :challenge
    association :user
    date_completed { nil }
    content { Rack::Test::UploadedFile.new('test/sets/submission_content/smile.jpg', 'image/jpg') }
    caption { "no caption" }
  end
end
