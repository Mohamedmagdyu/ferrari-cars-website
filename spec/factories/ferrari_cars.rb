FactoryBot.define do
  factory :ferrari_car do
    name { "Ferrari F8 Tributo" }
    model { "F8" }
    year { 2024 }
    price { 280000 }
    description { "A stunning sports car with exceptional performance" }
    engine { "V8 Twin-Turbo" }
    top_speed { 340 }
    acceleration { 2.9 }
    status { "available" }
    
    association :category
  end
end
