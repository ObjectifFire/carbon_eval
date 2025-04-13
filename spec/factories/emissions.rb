FactoryBot.define do
  factory :emission do
    emission_type { rand(0..2) }
    emission_quantity { rand(1..25) }
    company { association(:company) }
  end
end
