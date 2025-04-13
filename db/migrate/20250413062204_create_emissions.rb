class CreateEmissions < ActiveRecord::Migration[8.0]
  def change
    create_table :emissions do |t|
      t.integer :emission_type
      t.decimal :emission_quantity
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
