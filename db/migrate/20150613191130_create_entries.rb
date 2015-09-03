class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :type
      t.references :account
      t.references :currency
      t.references :category
      t.references :plutus_entry
      t.timestamps null: false
    end
  end
end
