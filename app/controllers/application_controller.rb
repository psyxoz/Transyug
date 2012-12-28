# encoding : utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :prepare_locale

  def prepare_locale
    if params[:locale] == nil
      I18n.locale = 'ru'
    else
      I18n.locale = params[:locale]
    end
  end

  def only_for_admin
    redirect_to root_path if current_user.role != 'admin'
  end
end
