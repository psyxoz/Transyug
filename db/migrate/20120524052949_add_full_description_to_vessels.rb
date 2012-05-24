class AddFullDescriptionToVessels < ActiveRecord::Migration
  def change
    add_column :vessels, :full_description_ru, :text
    add_column :vessels, :full_description_en, :text
  end
end
