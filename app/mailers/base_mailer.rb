# encoding : utf-8
class BaseMailer < ActionMailer::Base
  default from: "do-not-replay@transyug.com"

  def chartering(message)
    @message = message
    mail(to: "chartering@transyug.com", subject: "Заявка на фрахтование")
  end

  def technical_department(message)
    @message = message
    mail(to: "technical_department@transyug.com", subject: "Заявка в Тех. отдел")
  end

  def crewing(message)
    @message = message
    if params[:file]
      attachments['application_form'] = {
        content:    params[:file].read,
        mime_type:  params[:file].content_type
      }
    end
    mail(to: "af@transyug.com", subject: "Application form")
  end

  def application_form(app_form)
    @app_form = app_form
    mail(to: "af@transyug.com", subject: "Application form")
  end
end
