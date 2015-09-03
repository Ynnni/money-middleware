class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.references :currency
      t.references :plutus_account
      t.timestamps null: false
    end
  end
end
