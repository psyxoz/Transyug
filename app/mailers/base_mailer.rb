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
end
