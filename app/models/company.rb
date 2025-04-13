class Company < ApplicationRecord
  has_many :emissions

  EMISSION_MULTIPLIER = {'electricity' => 3, 'gaz' => 14, 'fuel' => 5}.freeze

  def calculate_emission
    emissions.sum{ |emission| emission.emission_quantity * EMISSION_MULTIPLIER[emission.emission_type] }
  end

  def update_total_emissions!
    update!(total_emissions: calculate_emission)
  end
end
