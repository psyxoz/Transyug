class JobsController < ApplicationController
  def index
    @page = Page.find_by_code(:jobs)
    @jobs = Job.order('created_at DESC')
  end

  def send_resume
    BaseMailer.resume(params[:message]).deliver unless params[:message].blank?
    render :nothing => true
  end
end
