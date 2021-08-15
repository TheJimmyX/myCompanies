class Company < ApplicationRecord
    has_many :employes
    validates :name, :nit, uniqueness: true
end
