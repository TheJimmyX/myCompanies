class CreateEmployes < ActiveRecord::Migration[6.1]
  def change
    create_table :employes do |t|
      t.string :first_name
      t.string :last_name
      t.string :id_type
      t.string :id_number
      t.string :phone_number
      t.string :email
      t.belongs_to :company, class_name: "company", foreign_key: "company_id"
      t.timestamps
    end
  end
end
