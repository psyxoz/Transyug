class Menu < ActiveRecord::Base
  attr_accessible :title, :code, :active
  validates :code, :presence => true, :uniqueness => true
end
