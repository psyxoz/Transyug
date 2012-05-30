class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string  :name_en
      t.string  :name_ru
      t.string  :code
      t.integer :order
      t.integer :independent
      t.timestamps
    end
  end
end
