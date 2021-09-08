FactoryBot.define do
  factory :item do
    name { Faker::Device.model_name }
    description { Faker::Quote.yoda }
    unit_price { Faker::Number.between(from: 20, to: 2000) }
    # unit_price { 1.5 }
    merchant 
  end
end
