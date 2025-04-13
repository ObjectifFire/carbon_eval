FactoryBot.define do
  factory :emission do
    emission_type { 1 }
    emission_quantity { "9.99" }
    company { nil }
  end
end
