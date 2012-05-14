# encoding : utf-8
class Admin::JobsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :only_for_admin
  layout "admin"

  def settings
    @page = Page.find_or_create_by_code('jobs')
    if params[:page]
      @page.update_attributes(params[:page])
      flash[:notice] = 'Страница успешно сохранена.'
      redirect_to :action => :settings
    end
  end

  def index
    @jobs = Job.order("id DESC").page(params[:page])
  end

  def new
    @job = Job.new
  end

  def edit
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(params[:job])
    if @job.save
      flash[:notice] = 'Вакансия успешно сохранена.'
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  def update
    @job = Job.find(params[:id])
    if @job.update_attributes(params[:job])
      flash[:notice] = 'Вакансия успешно обновлена.'
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to :action => :index
  end
end
