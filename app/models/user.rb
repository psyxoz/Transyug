class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :role

  # Override Devise's default registrations#edit behavior
  def update_with_password(params={})
    params.delete(:current_password)
    params[:password].blank? ? self.update_without_password(params) : self.update_attributes(params)
  end
end
