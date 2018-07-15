class ChangeInvoice < ActiveRecord::Migration[5.1]
  def change
    remove_column :invoices, :paid, :boolean
  end
end
