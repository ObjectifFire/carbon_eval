class CompaniesController < ApplicationController
  def index
    @companies = setup_companies
  end

  def pdf
    @companies = setup_companies
    
    pdf = Prawn::Document.new
  
    pdf.text "Liste des entreprises", size: 24, style: :bold
    pdf.move_down 20
  
    table_data = [["Nom", "SIRET", "Nb d’émissions"]]
  
    @companies.each do |company|
      table_data << [
        company.name,
        company.siret,
        company.emissions_count || company.emissions.size
      ]
    end
  
    pdf.table(table_data, header: true, row_colors: %w[F0F0F0 FFFFFF])
  
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
