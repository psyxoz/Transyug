# encoding : utf-8
class BaseMailer < ActionMailer::Base
  default from: "do-not-replay@transyug.com"

  def chartering(message, client_ip = '0.0.0.0')
    @message = message
    @client_ip = client_ip

    mail(to: "chartering@transyug.com", subject: "Заявка на фрахтование")
  end

  def technical_department(message, client_ip = '0.0.0.0')
    @message = message
    @client_ip = client_ip

    mail(to: "technical_department@transyug.com", subject: "Заявка в Тех. отдел")
  end

  def crewing(message, client_ip = '0.0.0.0')
    @message = message
    @client_ip = client_ip

    if message[:file]
      extension = File.extname(message[:file].original_filename) rescue ''
      attachments["application_form#{extension}"] = {
        content:    message[:file].read,
        mime_type:  message[:file].content_type
      }
    end

    mail(to: "crewing@transyug.com", subject: "Application form")
  end

  def application_form(form, client_ip = '0.0.0.0')
    @form = form
    @client_ip = client_ip
    @countries = {}

    Country.where(independent: 1).order("`order` desc, `name_ru` asc").map do |c|
      @countries[c.id] = c.name_ru
    end

    mail(to: "crewing@transyug.com", subject: "Application form")
  end

  def resume(message, client_ip = '0.0.0.0')
    @message = message
    @client_ip = client_ip

    if message[:file]
      extension = File.extname(message[:file].original_filename) rescue ''
      attachments["resume#{extension}"] = {
        content:    message[:file].read,
        mime_type:  message[:file].content_type
      }
    end

    mail(to: "navitramp@navitramp.com", subject: "Новое резюме")
  end

  def contacts(message, client_ip = '0.0.0.0')
    @message = message
    @client_ip = client_ip

    mails = {
      'Technical department' => 'technical_department@transyug.com',
      'Crewing' => 'crewing@transyug.com',
      'General' => 'transyug@transyug.com'
    }

    mail(to: mails[message[:department]] || 'transyug@transyug.com', subject: "Запрос с сайта")
  end
end
