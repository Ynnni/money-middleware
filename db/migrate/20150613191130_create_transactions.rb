class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.decimal :amount, precision: 10, scale: 2, default: 0.0
      t.date :date
      t.string :notice
      t.string :type
      t.references :account
      t.references :currency
      t.references :category
      t.timestamps null: false
    end
  end
end
