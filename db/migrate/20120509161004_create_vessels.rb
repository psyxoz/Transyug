class CreateVessels < ActiveRecord::Migration
  def change
    create_table :vessels do |t|
      t.string  :title_ru
      t.string  :title_en
      t.text    :description_ru
      t.text    :description_en
      t.text    :content_ru
      t.text    :content_en
      t.text    :location
      t.string  :pocket_plan
      t.boolean :archive,     :default => false
      t.boolean :featured,    :default => false
      t.integer :sort_id,     :default => 0
      t.timestamps
    end
  end
end
