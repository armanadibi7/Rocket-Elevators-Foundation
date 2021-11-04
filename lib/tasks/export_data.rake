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


        connection.exec("TRUNCATE fact_quotes RESTART IDENTITY")
        Quote.all.each do |quote|
            connection.exec("INSERT INTO \"fact_quotes\" (id, creation_date, company_name, email, number_of_elevators) 
            VALUES ('#{quote.id}', '#{quote.created_at}', '#{quote.company_name.gsub("'", "''")}', '#{quote.email}', '#{quote.amount_of_elevator}')")
        end

        puts "Done!"
    end

end
