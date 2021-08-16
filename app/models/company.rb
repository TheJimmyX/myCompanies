class Company < ApplicationRecord
    has_many :employes, dependent: :destroy
    validates :name, :nit, uniqueness: true
end
