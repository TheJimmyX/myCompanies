class Company < ApplicationRecord
    validates :name, :nit, uniqueness: true
end
