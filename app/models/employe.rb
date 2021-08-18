class Employe < ApplicationRecord
    belongs_to :company
    validates_uniqueness_of :first_name, scope: [:first_name, :last_name]
    validates_uniqueness_of :id_number, scope: [:id_type, :id_number]
end
