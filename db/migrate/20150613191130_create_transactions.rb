class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :type
      t.decimal :amount, precision: 20, scale: 10
      t.date :date
      t.string :description
      t.references :category
      t.references :account
      t.references :currency
      t.timestamps null: false
    end
  end
end
