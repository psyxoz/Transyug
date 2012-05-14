# encoding : utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  def only_for_admin
    redirect_to root_path unless current_user || current_user.role == 'admin'
  end
end
