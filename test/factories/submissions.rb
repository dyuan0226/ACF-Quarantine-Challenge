FactoryBot.define do
  factory :submission do
    association :challenge
    association :user
    date_completed { nil }
    media_url { "location" }
    caption { "this is a caption" }
    media_type { "photo" }
  end
end
