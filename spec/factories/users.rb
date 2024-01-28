FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
    password {"snowdenmoses"}
    status{ 0 }
    # Faker::Internet.password

    trait :personal_detail do
      after(:create) do |user|
        FactoryBot.create(:personal_detail, user_id: user.id)
      end
    end
  end
end
