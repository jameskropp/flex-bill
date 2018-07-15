class AddToInvoices < ActiveRecord::Migration[5.1]
  def change
    add_column :invoices, :sender_name, :string
  end
end
