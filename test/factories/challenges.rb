FactoryBot.define do
  factory :challenge do
    name { "Read John" }
    description { "Read the book of John and write a short reflection about what you learned." }
    category { "Bible" }
    num_points { 50 }
  end
end
