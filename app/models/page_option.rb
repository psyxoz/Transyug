class PageOption < ActiveRecord::Base
  attr_accessible :title, :content, :parent_id, :sort_id, :locale, :children_attributes
  has_many :children, :class_name => 'PageOption', :foreign_key => 'parent_id', :dependent => :destroy, :order => 'sort_id ASC'

  accepts_nested_attributes_for :children, :allow_destroy => true, :reject_if => proc { |attr| attr['title'].blank? }

  scope :only_parents, where(:parent_id => nil).includes(:children).order('sort_id ASC')
end
