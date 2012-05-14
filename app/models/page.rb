class Page < ActiveRecord::Base
  attr_accessible :title_ru, :description_ru, :content_ru, :title_en, :description_en, :content_en,
                  :code, :images_attributes, :images_attributes, :options_attributes

  has_many :images, :class_name => "PageImage", :dependent => :destroy
  has_many :options, :class_name => "PageOption", :dependent => :delete_all, :order => 'sort_id ASC'

  accepts_nested_attributes_for :images, :allow_destroy => true, :reject_if => proc { |attr| attr['file'].blank? }
  accepts_nested_attributes_for :options, :allow_destroy => true, :reject_if => proc { |attr| attr['title'].blank? }

  def self.company_config
    self.instance_eval do
      attr_accessible :pictures_attributes, :certificates_attributes
      has_many :pictures, class_name: "PageImage", conditions: {alias: :image}, dependent: :destroy
      has_many :certificates, class_name: "PageImage", conditions: {alias: :certificate}, dependent: :destroy
      accepts_nested_attributes_for :pictures, :certificates, allow_destroy: true, reject_if: proc { |attr| attr['file'].blank? }
    end
  end
end
