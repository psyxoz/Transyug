class CreatePageImages < ActiveRecord::Migration
  def change
    create_table :page_images do |t|
      t.integer :page_id
      t.string  :file
      t.string  :alias
      t.integer :sort_id, :default => 0
      t.timestamps
    end
  end
end
