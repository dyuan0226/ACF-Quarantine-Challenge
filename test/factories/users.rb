FactoryBot.define do
  factory :user do
    first_name { "Ricky" }
    last_name { "Ma" }
    association :team
    username { "rickyma" }
    password { "secret" }
    password_confirmation { "secret" }
    role { "admin" }
    email { "rickyma@gmail.com" }
    active { true }
  end
end
