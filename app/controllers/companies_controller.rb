class CompaniesController < ApplicationController
  def index
    @companies = setup_companies
  end

  def pdf
    @companies = setup_companies

    pdf = CreatePdfService.new({company_id:  @companies.first.id}).call!
    
    send_data pdf.render,
    filename: "companies.pdf",
    type: "application/pdf",
    disposition: "inline"
  end

  private
    def setup_companies
      @companies = Company.includes(:emissions).limit(25)
    end
  
end
