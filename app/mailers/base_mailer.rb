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
    if message[:file]
      attachments['application_form'] = {
        content:    message[:file].read,
        mime_type:  message[:file].content_type
      }
    end
    mail(to: "crewing@transyug.com", subject: "Application form")
  end

  def application_form(form)
    @form = form
    mail(to: "crewing@transyug.com", subject: "Application form")
  end

  def resume(message)
    @message = message
    if message[:file]
      attachments['resume'] = {
        content:    message[:file].read,
        mime_type:  message[:file].content_type
      }
    end
    mail(to: "navitramp@navitramp.com", subject: "Новое резюме")
  end

  def contacts(message)
    @message = message
    mails = {'Technical department' => 'technical_department@transyug.com', 'Crewing' => 'crewing@transyug.com', 'General' => 'transyug@transyug.com'}
    mail(to: mails[message[:department]] || 'transyug@transyug.com', subject: "Запрос с сайта")
  end
end
