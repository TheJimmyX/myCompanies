class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :nit
      t.string :address
      t.string :phone_number

      t.timestamps
    end
  end
end
