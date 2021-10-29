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
        password: "codeboxx1",
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

puts "Seeding Done!"
