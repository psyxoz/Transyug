class CreateVesselImages < ActiveRecord::Migration
  def change
    create_table :vessel_images do |t|
      t.integer :vessel_id
      t.string  :file
      t.integer :sort_id, :default => 0
      t.timestamps
    end
  end
end
