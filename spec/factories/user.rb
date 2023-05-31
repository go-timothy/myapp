require 'faker'

FactoryBot.define do
    factory :user do
        id { 1 }
        email { Faker::Internet.email }
        password { "12fhf456465asA34" }
        isAdmin { true }
    end

    factory :normalUser do
        id { 2 }
        email { Faker::Internet.email }
        isAdmin { false }
    end
  end