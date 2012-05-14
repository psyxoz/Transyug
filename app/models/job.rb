class Job < ActiveRecord::Base
  attr_accessible :title_ru, :description_ru, :title_en, :description_en, :sort_id
end
