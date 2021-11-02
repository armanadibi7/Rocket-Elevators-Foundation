# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

employees = [
    {
        first_name: 'Nicolas',
        last_name: 'Genest',
        title: 'CEO',
        email: 'nicolas.genest@codeboxx.biz'
    },
    {
        first_name: 'Nadya',
        last_name: 'Fortier',
        title: 'Director',
        email: 'nadya.fortier@codeboxx.biz'
    },
    {
        first_name: 'Martin',
        last_name: 'Chantal',
        title: 'Director Assistant',
        email: 'martin.chantal@codeboxx.biz'
    },
    {
        first_name: 'Mathieu',
        last_name: 'Houde',
        title: 'Captain',
        email: 'mathieu.houde@codeboxx.biz'
    },
    {
        first_name: 'Patrick ',
        last_name: 'Thibault',
        title: 'Captain',
        email: 'patrick.thibault@codeboxx.biz'
    },
    {
        first_name: 'David',
        last_name: 'Boutin',
        title: 'Engineer',
        email: 'david.boutin@codeboxx.biz'
    },
    {
        first_name: 'Mathieu',
        last_name: 'Lortie',
        title: 'Engineer',
        email: 'mathieu.lortie@codeboxx.biz'
    },
    {
        first_name: 'Thomas',
        last_name: 'Carrier',
        title: 'Engineer',
        email: 'thomas.carrier@codeboxx.biz'
    },
    {
        first_name: 'Serge',
        last_name: 'Savoie',
        title: 'Engineer',
        email: 'serge.savoie@codeboxx.biz'
    },
    {
        first_name: 'Francis',
        last_name: 'Patry-Jessop',
        title: 'Engineer',
        email: 'francis.patry-jessop@codeboxx.biz'
    },
    {
        first_name: 'Mathieu',
        last_name: 'Lefrancois',
        title: 'Engineer',
        email: 'mathieu.lefrancois@codeboxx.biz'
    },
    {
        first_name: 'David',
        last_name: 'Larochelle',
        title: 'Engineer',
        email: 'david.larochelle@codeboxx.biz'
    },
    {
        first_name: 'Nicolas',
        last_name: 'Pineault',
        title: 'Engineer',
        email: 'nicolas.pineault@codeboxx.biz'
    },
    {
        first_name: 'David',
        last_name: 'Amyot',
        title: 'Engineer',
        email: 'david.amyot@codeboxx.biz'
    },
    {
        first_name: 'Remi',
        last_name: 'Gagnon',
        title: 'Engineer',
        email: 'remi.gagnon@codeboxx.biz'
    },
    {
        first_name: 'Timothy',
        last_name: 'Wever',
        title: 'Developer',
        email: 'timothy.wever@codeboxx.biz'
    },
    {
        first_name: 'Kiril',
        last_name: 'Kleinerman',
        title: 'Developer',
        email: 'kiril.kleinerman@codeboxx.biz'
    },
    {
        first_name: 'Emmanuela',
        last_name: 'Derilus',
        title: 'Developer',
        email: 'emmanuela.derilus@codeboxx.biz'
    },
    {
        first_name: 'Abdul',
        last_name: 'Akeeb',
        title: 'Developer',
        email: 'abdul.akeeb@codebozz.biz'
    },
    {
        first_name: 'Krista',
        last_name: 'Sheely',
        title: 'Developer',
        email: 'krista.sheely@codeboxx.biz'
    },
    {
        first_name: 'Jonathan',
        last_name: 'Murray',
        title: 'Developer',
        email: 'jonathan.murray@codeboxx.biz'
    }
    
]


# <Model>.create({ key: value })
# <Model>.create({ "key" => value })
# <Model>.create( key: value )
    
employees.each do |employee|
    user = User.create!(
        first_name: employee[:first_name],
        last_name: employee[:last_name],
        phone_number: 1112223333,
        email: employee[:email],
        password: "password",
        is_admin: TRUE, 
    )


    Employee.create!(
        first_name: employee[:first_name],
        last_name: employee[:last_name],
        title: employee[:title],
        email: employee[:email],
        user: user   
    )
end

require 'faker'

100.times do
    address = Addressy::US.fetch(10).first
    addresses = Address.new(
        
        address_type: ["House", "Apartment", "Commercial", "Corporate", "Hybrid"].sample,
        status: ["Active", "Inactive"].sample,
        entity: ["Customer", "Building"].sample,
        number_and_street: address.street,
        suite_and_apartment: address.street.split(" ")[0],
        city: address.city,
        postal_code: address.zip,
        country: "USA",
        notes: Faker::Lorem.sentence(word_count: rand(3..9).floor)
    )
    addresses.save
end

100.times do
    customers = Customer.new(

        company_name: Faker::Company.name, #=> "Hirthe-Ritchie"
        #company_address: addressy.full, #link to real address with address
        company_contact_name: Faker::Name.name , #=> "Tyshawn Johns Sr."
        contact_phone: Faker::PhoneNumber.cell_phone, #=> "(186)285-7925"
        contact_email: Faker::Internet.unique.email, #=> "eliza@mann.net"
        company_description: Faker::Company.catch_phrase, #=> "Business-focused coherent parallelism"
        service_tech_name: Faker::Name.name , #=> "Tyshawn Johns Sr."
        service_tech_phone: Faker::PhoneNumber.cell_phone, #=> "(186)285-7925"
        service_tech_email: Faker::Internet.unique.email #=> "eliza@mann.net"
    )
    customers.save
end

100.times do
    batteries = Battery.new(

        battery_type: ["Residential", "Commercial", "Corporate", "Hybrid"].sample,
        status: "Active", 
        date_of_commissioning: Faker::Date.between(from: '2017-09-23', to: '2021-09-25'), #=> #<Date: 2014-09-24>, 
        date_of_last_inspection: Faker::Date.between(from: '2017-09-23', to: '2021-09-25'), #=> #<Date: 2014-09-24>, 
        certificate_of_operations: 'Certified',
        information: Faker::Lorem.sentence(word_count: 11),
        notes: Faker::Lorem.sentence(word_count: rand(3..12).floor)
    )
    batteries.save
end

100.times do
    columns = Column.new(
        column_type: ['Commercial', 'Residential', 'Corporate',].sample, 
        number_of_floor: Faker::Number.decimal_part(digits: 2), #=> "09"
        status: Faker::Boolean.boolean, #=> true
        information: Faker::Types.complex_rb_hash(number: 1), #=> {user: {first: "bob", last: "marley"}}
        notes: Faker::Quote.yoda #=> "Use your feelings, Obi-Wan, and find him you will."
    )
    columns.save
end

100.times do
    elevators = Elevator.new(
        serial_number: Faker::Number.number(digits: 10), #=> 1968353479
        model: ['Standard', 'Premium', 'Excelium'].sample, 
        elevator_type: ['Commercial', 'Residential', 'Corporate',].sample, 
        status: Faker::Boolean.boolean, #=> true
        date_of_commissioning: Faker::Date.between(from: '2017-09-23', to: '2021-09-25'), #=> #<Date: 2014-09-24>
        date_of_last_inspection: Faker::Date.between(from: '2017-09-23', to: '2021-09-25'), #=> #<Date: 2014-09-24>
        notes: Faker::Quote.yoda #=> "Use your feelings, Obi-Wan, and find him you will."
    )
    elevators.save
end

puts "Seeding Done!"
