class PageImage < ActiveRecord::Base
  attr_accessible :file, :type, :page_id
  mount_uploader :file, PageImageUploader
  belongs_to :page
end
