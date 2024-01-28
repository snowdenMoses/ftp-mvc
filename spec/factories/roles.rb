FactoryBot.define do
  factory :role do
    title {Faker::Book.genre}
  end
end
