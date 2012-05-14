# encoding : utf-8
class Admin::VesselsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :only_for_admin
  layout "admin"

  def settings
    @page = Page.find_or_create_by_code('fleet')
    if params[:page]
      @page.update_attributes(params[:page])
      flash[:notice] = 'Страница успешно сохранена.'
      redirect_to :action => :settings
    end
  end

  def index
    @vessels = Vessel.order("id DESC").page(params[:page])
  end

  def new
    @vessel = Vessel.new
  end

  def edit
    @vessel = Vessel.find(params[:id])
  end

  def create
    @vessel = Vessel.new(params[:vessel])
    if @vessel.save
      flash[:notice] = 'Судно успешно сохранено.'
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  def update
    @vessel = Vessel.find(params[:id])
    if @vessel.update_attributes(params[:vessel])
      flash[:notice] = 'Судно успешно обновлено.'
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end

  def destroy
    @vessel = Vessel.find(params[:id])
    @vessel.destroy
    redirect_to :action => :index
  end
end
