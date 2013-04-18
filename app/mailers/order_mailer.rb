#!/bin/env ruby
# encoding: utf-8
class OrderMailer < ActionMailer::Base
  default :from => "shlakomilo@yandex.ru"
  
  def order_complete(order, product, adress)
  	@order = order
  	@product = product
    mail(:to => adress, :subject => "Заказ в мейкмайдресс №#{order.id}")
  end
end
