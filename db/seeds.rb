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

    15.times do
        fn = Faker::Name.first_name
        ln = Faker::Name.last_name

        employe = Employe.new(
            first_name: fn,
            last_name: ln,
            id_type: "CC", 
            id_number: Faker::Number.number(digits: 12), 
            phone_number: Faker::Number.number(digits: 10), 
            email: "#{fn}.#{ln}@#{company.name.delete(' ').delete(',')}.com".downcase,
            company_id: company.id
        )

        employe.save if employe.valid?
    end
end