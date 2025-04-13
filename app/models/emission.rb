class Emission < ApplicationRecord
  belongs_to :company, counter_cache: true
end
