require 'csv'

def import_data(model_files)
  model_files.each do |model, filename|
    CSV.foreach("lib/assets/#{filename}", headers: true) do |row|
      model.find_or_create_by(row.to_hash)
    end
  end
end

desc "Imports CSV files to database"
task :import, [:csvs] => :environment do
  import_data([[Customer, "customers.csv"],
               [InvoiceItem, "invoice_items.csv"],
               [Invoice, "invoices.csv"],
               [Item, "items.csv"],
               [Merchant, "merchants.csv"]])
  CSV.read("lib/assets/transactions.csv", headers: true).each do |row|
    Transaction.create!(row.to_h.except("credit_card_expiration_date"))
  end
end
