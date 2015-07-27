require 'csv'

def import_data(files)
  files.each do |filename|
    CSV.foreach("lib/assets/#{filename}", :headers => true) do |row|
      # MyModel.create!(row.to_hash)
      puts row
    end
  end
end

desc "Imports CSV files to database"
task :import, [:csvs] => :environment do
  import_data(["customers.csv", "invoice_items.csv, invoices.csv, items.csv, merchants.csv, transactions.csv"])
end
