FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
  end
end
