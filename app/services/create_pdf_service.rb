class CreatePdfService
  def initialize(attr = {})
    @company = Company.find(attr[:company_id])
  end

  def call!
    calculate_total_emissions_for_company
    generate_company_report
  end

  private

  def calculate_total_emissions_for_company
    begin
      @company.update_total_emissions!
    rescue StandardError => e
      raise e
    end
  end

  def generate_company_report
    pdf = Prawn::Document.new
  
    pdf.text "Liste des entreprises", size: 24, style: :bold
    pdf.move_down 20
  
    table_data = [["Nom", "SIRET", "Nb d’émissions", "Total des emissions"]]
    table_data << [
      @company.name,
      @company.siret,
      @company.emissions_count,
      @company.total_emissions
    ]

    pdf.table(table_data, header: true, row_colors: %w[F0F0F0 FFFFFF])

    pdf
  end
end