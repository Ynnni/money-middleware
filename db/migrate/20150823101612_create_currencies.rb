class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :title
      t.string :code
      t.timestamps null: false
    end
  end
end
