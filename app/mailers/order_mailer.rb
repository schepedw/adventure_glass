class OrderMailer < ActionMailer::Base
  include PictureTagHelper
  default from: "schepedw@gmail.com"

  def confirm_order(order)
    order = Order.all.find{|o| !o.products.empty?}#TODO: remove, obviously...
    @user = order.user
    @cart = order.shopping_cart
    @products = order.products
    mail(to: 'amknies@umail.iu.edu', subject: "Adventure Glass Order ##{order.id}")
    #mail(to: order.user.email, bcc: 'schepedw@gmail.com', subject: "Adventure Glass Order ##{order.id}")
  end

end
