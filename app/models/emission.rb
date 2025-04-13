class Emission < ApplicationRecord
  belongs_to :company, counter_cache: true

  enum :emission_type, [ :electricity, :gaz, :fuel ]
end
