class OrderMailer < ActionMailer::Base
  default from: "schepedw@gmail.com"

  def confirm_order(order)
    @user = order.user
    @cart = order.shopping_cart
    @products = order.products
    mail(to: order.user.email, bcc: 'schepedw@gmail.com', subject: "Adventure Glass Order ##{order.id}")
  end

end
