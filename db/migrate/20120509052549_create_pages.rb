class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string  :code
      t.string  :title_ru
      t.string  :title_en
      t.text    :description_ru
      t.text    :description_en
      t.text    :content_ru
      t.text    :content_en
      t.text    :extra
      t.timestamps
    end
    add_index :pages, :code, :unique => true
  end
end
