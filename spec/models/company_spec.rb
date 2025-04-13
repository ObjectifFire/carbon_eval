require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:company) { FactoryBot.create(:company)}
  let(:emissions) { FactoryBot.create_list(:emission, 12, company:)}
 
  describe 'Company evaluates carbon emissions' do
    context 'When company need to get the value of all emissions' do
      it '' do
        expect(company.update_total_emissions!).not_to eq(nil)
      end
    end
  end
end
