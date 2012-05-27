# encoding : utf-8
class PagesController < ApplicationController
  def show
    @active_page = params[:code]
    Page.send("#{@active_page}_config".to_sym) if Page.respond_to?("#{@active_page}_config")

    @page = Page.find_by_code(@active_page)
    if @page.code == 'technical_department'
      @options = PageOption.only_parents.where(page_id: @page.id, locale: I18n.locale)
    end

    render :template => "pages/#{@active_page}"
  end

  def chartering_send
    BaseMailer.chartering(params[:message]).deliver unless params[:message].blank?
    render :nothing => true
  end

  def technical_department_send
    BaseMailer.technical_department(params[:message]).deliver unless params[:message].blank?
    render :nothing => true
  end
end
