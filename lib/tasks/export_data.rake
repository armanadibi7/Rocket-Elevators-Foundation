require 'pg'

namespace :export_data do
    desc "export data from mysql and import it into pgsql"
    task :mysql => :environment do

        puts "Exporting data from mySQL server..."
        connection = PG::Connection.open(host: "localhost", port: 5432, dbname: "myapp_development", user: "root", password: "password")

        connection.exec("TRUNCATE fact_contacts RESTART IDENTITY")
        Lead.all.each do |lead|
            connection.exec("INSERT INTO \"fact_contacts\" (id, creation_date, company_name, email, project_name) 
            VALUES ('#{lead.id}', '#{lead.created_at}', '#{lead.company_name.gsub("'", "''")}', '#{lead.email}', '#{lead.project_name.gsub("'", "''")}')")
        end

        
        connection.exec("TRUNCATE fact_quotes RESTART IDENTITY")
        Quote.all.each do |quote|
            connection.exec("INSERT INTO \"fact_quotes\" (id, creation_date, company_name, email, number_of_elevators) 
            VALUES ('#{quote.id}', '#{quote.created_at}', '#{quote.company_name.gsub("'", "''")}', '#{quote.email}', '#{quote.amount_of_elevator}')")
        end

        puts "Importing data to PostgreSQL.."
        connection.exec("TRUNCATE fact_elevators RESTART IDENTITY")
        Elevator.all.each do |elevator|
            connection.exec("INSERT INTO \"fact_elevators\" (id, serial_number, date_of_commissionning, building_id, customer_id, building_city) 
            VALUES ('#{elevator.id}', '#{elevator.serial_number}', '#{elevator.date_of_commissioning}', '#{elevator.column.battery.building_id}', '#{elevator.column.battery.building.customer_id}', '#{elevator.column.battery.building.address.city}')")
        end

        connection.exec("TRUNCATE fact_quotes RESTART IDENTITY")
        Quote.all.each do |quote|
            connection.exec("INSERT INTO \"fact_quotes\" (id, creation_date, company_name, email, number_of_elevators) 
            VALUES ('#{quote.id}', '#{quote.created_at}', '#{quote.company_name.gsub("'", "''")}', '#{quote.email}', '#{quote.amount_of_elevator}')")
        end


        connection.exec("TRUNCATE dim_customers RESTART IDENTITY")
        Customer.all.each do |customer|
            elevatorCount = 0
            customer.buildings.all.each do |building| 
                building.batteries.all.each do |battery|
                    battery.columns.all.each do |column|
                        elevatorCount =+ column.elevators.count
                    end
                end
            end
            connection.exec("INSERT INTO \"dim_customers\" (id, creation_date, company_name, admin_full_name, number_of_elevators, customer_city)
            VALUES ('#{customer.id}', '#{customer.created_at}', '#{customer.company_name.gsub("'", "''")}', '#{customer.company_contact_name.gsub("'", "''")}', '#{elevatorCount}', '#{customer.address.city.gsub("'", "''")}')")
        end


        puts "Done!"
    end

end
