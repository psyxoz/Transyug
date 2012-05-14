# encoding : utf-8
class Admin::PartnersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :only_for_admin
  layout "admin"

  def index
    @partners = Partner.order("id DESC").page(params[:page])
  end

  def new
    @partner = Partner.new
  end

  def edit
    @partner = Partner.find(params[:id])
  end

  def create
    @partner = Partner.new(params[:partner])
    if @partner.save
      flash[:notice] = 'Партнер успешно сохранен.'
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  def update
    @partner = Partner.find(params[:id])
    if @partner.update_attributes(params[:partner])
      flash[:notice] = 'Партнер успешно обновлен.'
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end

  def destroy
    @partner = Partner.find(params[:id])
    @partner.destroy
    redirect_to :action => :index
  end
end
