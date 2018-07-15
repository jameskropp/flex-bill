class CreateInvoicePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :invoice_payments do |t|
      t.references :invoice, foreign_key: true, null: false, index: true
      t.integer :amount, null: false
      t.boolean :paid, null: false, default: false

      t.timestamps
    end
  end
end
