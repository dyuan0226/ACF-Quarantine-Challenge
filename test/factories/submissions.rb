FactoryBot.define do
  factory :submission do
    association :challenge
    association :user
    date_completed { 1.day.ago.to_date }
  end
end
