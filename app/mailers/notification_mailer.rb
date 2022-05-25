class NotificationMailer < ApplicationMailer
  def new_notification_email
    mail(to: 'example@example.com', subject: "Hello from Ruby on rails!")
  end
end
