# encoding : utf-8
class Admin::MenusController < ApplicationController
  before_filter :authenticate_user!
  before_filter :only_for_admin
  layout "admin"

  def index
    @menus = Menu.all
  end

  def update
    @menu = Menu.find_by_code(params[:code])
    @menu.update_attribute(:active, params[:active]) unless @menu.blank?
    render :json => true
  end
end
