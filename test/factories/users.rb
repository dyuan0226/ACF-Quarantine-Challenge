FactoryBot.define do
  factory :user do
    first_name { "Ricky" }
    last_name { "Ma" }
    association :team
    username { "rickyma" }
    password { "secret" }
    password_confirmation { "secret" }
    admin_password { nil }
    email { "rickyma@gmail.com" }
    active { nil }
  end
end
