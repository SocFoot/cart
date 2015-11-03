# Preview all emails at http://localhost:3000/rails/mailers/cart_error_mailer
class CartErrorMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/cart_error_mailer/cart_error
  def cart_error
    CartErrorMailer.cart_error
  end

end
