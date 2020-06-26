FactoryBot.define do
  factory :submission do
    association :challenge
    association :user
    date_completed { nil }
  end
end
