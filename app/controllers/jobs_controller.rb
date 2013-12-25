class JobsController < ApplicationController
  def index
    check_menu(:jobs)
    @page = Page.find_by_code(:jobs)
    @jobs = Job.order('created_at DESC')
  end

  def send_resume
    unless params[:message].blank?
      IpTracking.create(message: params[:message], ip: request.remote_ip)
      BaseMailer.resume(params[:message], request.remote_ip).deliver
    end
    render :nothing => true
  end
end
