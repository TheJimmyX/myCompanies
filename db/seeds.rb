# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times do 
    company = Company.new(    
        name: Faker::Company.name,
        nit: Faker::Number.number(digits: 10),
        address: Faker::Address.full_address,
        phone_number: Faker::Number.number(digits: 10)
    )

    company.save if company.valid?
end