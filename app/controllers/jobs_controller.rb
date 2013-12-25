class JobsController < ApplicationController
  def index
    check_menu(:jobs)
    @page = Page.find_by_code(:jobs)
    @jobs = Job.order('created_at DESC')
  end

  def send_resume
    BaseMailer.resume(params[:message], request.remote_ip).deliver unless params[:message].blank?
    render :nothing => true
  end
end
