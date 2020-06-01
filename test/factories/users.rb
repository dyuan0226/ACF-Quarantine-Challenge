FactoryBot.define do
  factory :user do
    first_name { "MyString" }
    last_name { "MyString" }
    team { nil }
    username { "MyString" }
    password_digest { "MyString" }
    role { "MyString" }
    email { "MyString" }
    active { false }
  end
end
