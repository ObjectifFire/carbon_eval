class CompaniesController < ApplicationController
  before_action :set_company, only: [:pdf]

  def index
    @companies = setup_companies
  end

  def pdf
    pdf = CreatePdfService.new({company_id:  @company.id}).call!

    send_data pdf.render,
    filename: "companies.pdf",
    type: "application/pdf",
    disposition: "inline"
  end

  private
    def setup_companies
      @companies = Company.includes(:emissions).limit(25)
    end

    def set_company
      @company = Company.find(params[:id])
    end
end
