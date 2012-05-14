# encoding : utf-8
class Admin::PagesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :only_for_admin
  layout "admin"

  def show
    @active_page = params[:code]
    Page.send("#{@active_page}_config".to_sym) if Page.respond_to?("#{@active_page}_config")

    @page = Page.find_by_code(@active_page)
    unless @page
      flash[:notice] = 'Страница не найдена'
      redirect_to admin_path
    end

    if params[:page]
      @page.update_attributes(params[:page])
      flash[:notice] = 'Страница успешно сохранена.'
      redirect_to :action => :show
    end
  end
end
