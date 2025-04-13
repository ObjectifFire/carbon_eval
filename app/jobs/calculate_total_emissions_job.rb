class CalculateTotalEmissionsJob < ApplicationJob
  queue_as :default

  def perform(company_id)
    @company = Company.find(company_id)
  end

  private
    def calculate_total_emissions_for_company
      begin
        @company.update_total_emissions!
      rescue StandardError => e
        raise e
      end
    end
end
