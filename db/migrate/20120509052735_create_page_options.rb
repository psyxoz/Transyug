class CreatePageOptions < ActiveRecord::Migration
  def change
    create_table :page_options do |t|
      t.integer :page_id
      t.integer :parent_id
      t.string  :title
      t.text    :content
      t.string  :locale,  :default => :ru
      t.integer :sort_id, :default => 0
      t.timestamps
    end
  end
end
