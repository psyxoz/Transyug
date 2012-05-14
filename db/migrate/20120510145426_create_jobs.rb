class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string  :title_ru
      t.string  :title_en
      t.text    :description_ru
      t.text    :description_en
      t.integer :sort_id, :default => 0
      t.timestamps
    end
  end
end
