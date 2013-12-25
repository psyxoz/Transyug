# encoding : utf-8
class PagesController < ApplicationController
  def show
    @active_page = params[:code]
    Page.send("#{@active_page}_config".to_sym) if Page.respond_to?("#{@active_page}_config")

    @page = Page.find_by_code(@active_page)
    check_menu(@page.code)

    if @page.code == 'technical_department'
      @options = PageOption.only_parents.where(page_id: @page.id, locale: I18n.locale)
    end

    render :template => "pages/#{@active_page}"
  end

  def chartering_send
    unless params[:message].blank?
      IpTracking.create(message: params[:message], ip: request.remote_ip)
      BaseMailer.chartering(params[:message], request.remote_ip).deliver
    end
    render :nothing => true
  end

  def technical_department_send
    unless params[:message].blank?
      IpTracking.create(message: params[:message], ip: request.remote_ip)
      BaseMailer.technical_department(params[:message], request.remote_ip).deliver
    end
    render :nothing => true
  end

  def crewing_send
    unless params[:message].blank?
      IpTracking.create(message: params[:message], ip: request.remote_ip)
      BaseMailer.crewing(params[:message], request.remote_ip).deliver
    end
    render :nothing => true
  end

  def application_form
    unless params[:application_form].blank?
      IpTracking.create(message: params[:message], ip: request.remote_ip)
      BaseMailer.application_form(params[:application_form], request.remote_ip).deliver
      render :nothing => true
    end
  end

  def contacts_send
    unless params[:message].blank?
      IpTracking.create(message: params[:message], ip: request.remote_ip)
      BaseMailer.contacts(params[:message], request.remote_ip).deliver
    end
    render :nothing => true
  end
end
