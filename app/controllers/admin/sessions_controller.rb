class Admin::SessionsController < Devise::SessionsController
  layout "admin"

  def after_sign_out_path_for(resource)
    root_path(I18n.locale)
  end
end