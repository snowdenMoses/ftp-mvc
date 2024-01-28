FactoryBot.define do
  factory :personal_detail do
    first_name { Faker::Games::DnD.first_name }
    last_name { Faker::Games::Pokemon.name }
    middle_name { Faker::Games::Pokemon.name }
    date_of_birth { rand(Date.today.beginning_of_year..Date.today.end_of_year) }
    city { Faker::Games::DnD.city }
    gender { ["male", "female"].sample }
    phone_number { [0,2,3,1,4,5,6,7,8,9,2,4,5,6,9].sample(11).join }
    user
  end
end
