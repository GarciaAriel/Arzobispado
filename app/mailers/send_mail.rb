class SendMail < ActionMailer::Base
  default from: "arzotemporal@gmail.com"
  def testeando
  	mail(to: 'nelsonaraoz@ymail.com', subject: 'Testeo')
  end
end
