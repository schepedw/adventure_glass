class OrderMailer < ActionMailer::Base
  default from: "order-status@advboat.com"

  def confirm_order(order)
    mail(to: order.user.email, cc: 'dav@advboat.com', bcc: 'schepedw@gmail.com', subject: "Adventure Glass Order #{order.id}")
  end
end
