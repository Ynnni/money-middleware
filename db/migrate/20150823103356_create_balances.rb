class CreateBalances < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.decimal :total, precision: 10, scale: 2, default: 0.0
      t.references :account
      t.references :currency
      t.timestamps null: false
    end
  end
end
