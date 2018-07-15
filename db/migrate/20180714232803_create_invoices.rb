class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.references :user, foreign_key: true, null: false, index: true
      t.string :to_email, null: false
      t.string :project_name
      t.string :description
      t.string :invoice_type, null: false, default: "once"
      t.integer :total_cost, null: false
      t.boolean :paid, null: false, default: false
      t.string :status, null: false, default: "unpaid"

      t.timestamps
    end
  end
end
