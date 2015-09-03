class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :code
      t.decimal :exchange_rate, precision: 20, scale: 10
      t.timestamps null: false
    end
  end
end
