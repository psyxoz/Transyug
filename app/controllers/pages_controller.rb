# encoding : utf-8
class PagesController < ApplicationController
  def show
    @active_page = params[:code]
    Page.send("#{@active_page}_config".to_sym) if Page.respond_to?("#{@active_page}_config")

    @page = Page.find_by_code(@active_page)
    render :template => "pages/#{@active_page}"
  end

  def chartering_send
    BaseMailer.chartering(params[:message]).deliver unless params[:message].blank?
    render :nothing => true
  end
end
