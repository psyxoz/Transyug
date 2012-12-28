# encoding : utf-8
class CreateMenus < ActiveRecord::Migration
  def up
    create_table :menus do |t|
      t.string  :code
      t.string  :title
      t.boolean :active, :default => true
      t.timestamps
    end
    add_index :menus, :code, :unique => true

    Menu.create([
      {:code => :company,               :title => 'О компании'},
      {:code => :fleet,                 :title => 'Флот'},
      {:code => :chartering,            :title => 'Фрахтование'},
      {:code => :technical_department,  :title => 'Технический отдел'},
      {:code => :crewing,               :title => 'Крюинг'},
      {:code => :vacancy,               :title => 'Вакансии'},
      {:code => :partners,              :title => 'Партнеры'},
      {:code => :contacts,              :title => 'Контакты'}
    ])
  end

  def down
    drop_table :menus
  end
end
