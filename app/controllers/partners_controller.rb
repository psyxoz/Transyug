class PartnersController < ApplicationController
  def index
    @partners = Partner.order("title_#{I18n.locale} ASC")
  end
end
