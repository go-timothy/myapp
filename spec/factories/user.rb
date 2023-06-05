require 'faker'

FactoryBot.define do
  factory :user do
    trait :admin do
      email { Faker::Internet.email }
      password { Faker::Internet.password }
      isAdmin { true }
    end

    trait :normalUser do
      email { Faker::Internet.email }
      isAdmin { false }
    end
  end
end
