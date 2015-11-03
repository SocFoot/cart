class CartErrorMailer < ApplicationMailer
  default from: 'from@example.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.cart_error_mailer.cart_error.subject
  #
  def cart_error(error)
    
    mail to: "nzakou.cedric@gmail.com", subject: "Cart error"
  end
end
