FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "Category #{n}" }
    description { "A luxury Ferrari category" }
  end
end
