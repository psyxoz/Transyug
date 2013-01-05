class PartnersController < ApplicationController
  def index
    check_menu(:partners)
    @partners = Partner.order("title_#{I18n.locale} ASC")
  end
end
