class CreateBalance < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.decimal :balance, precision: 20, scale: 10, default: 0.0
      t.references :account, index: true
      t.references :currency, index: true
    end
  end
end
