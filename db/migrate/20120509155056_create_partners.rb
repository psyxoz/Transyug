class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string  :title_ru
      t.string  :title_en
      t.string  :link
      t.integer :sort_id, :default => 0
      t.timestamps
    end
  end
end
