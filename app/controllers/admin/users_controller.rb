# encoding : utf-8
class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :only_for_admin
  layout "admin"

  def index
    @users = User.order("id DESC").page(params[:page])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    params[:user][:password] = params[:password] if params[:password] && !params[:password].blank?

    if @user.update_attributes(params[:user])
      flash[:notice] = "Данные пользователя успешно сохранены."
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end

  def create
    params[:user][:password] = params[:password] if params[:password] && !params[:password].blank?
    @user = User.new(params[:user])
    if @user.save()
      flash[:notice] = "Пользователь добавлен."
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  def destroy
    if params[:id].to_i == current_user.id
      flash[:error] = "Вы не можете удалить самого себя!"
    else
      User.find(params[:id]).destroy
    end
    redirect_to :action => :index
  end
end

