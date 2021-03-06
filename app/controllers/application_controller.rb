# encoding : utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :prepare_locale, :prepare_menus

  def prepare_locale
    I18n.locale = params[:locale].presence || I18n.default_locale
  end

  def prepare_menus
    @active_menus ||= Menu.active.map(&:code)
  end

  def check_menu(code)
    redirect_to root_url unless @active_menus.include?(code.to_s)
  end

  def only_for_admin
    redirect_to root_path if current_user.role != 'admin'
  end
end
