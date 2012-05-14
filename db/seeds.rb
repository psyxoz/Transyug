# encoding : utf-8
if Rails.env != 'production'
  User.transaction do
    User.create(
      :email => 'admin@admin.com',
      :password => 'password',
      :password_confirmation => 'password',
      :role => 'admin'
    )
  end

  Page.create([
    {:code => :company,               :title_ru => "О компании"},
    {:code => :fleet,                 :title_ru => "Флот"},
    {:code => :chartering,            :title_ru => "Фрахтование"},
    {:code => :technical_department,  :title_ru => "Технический отдел"},
    {:code => :crewing,               :title_ru => "Крюинг"},
    {:code => :jobs,                  :title_ru => "Вакансии"},
    {:code => :contacts,              :title_ru => "Контакты"}
  ])
end

