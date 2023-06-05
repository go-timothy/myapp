require 'faker'

FactoryBot.define do
    factory :task do
        trait :user_id1 do
            title { Faker::String.random(5) }
            detail { Faker::String.random(5) }
            user_id { 1 }
        end
        
        trait :user_id2 do
            title { Faker::String.random(5) }
            detail { Faker::String.random(5) }
            user_id { 2 }
        end
    end
end