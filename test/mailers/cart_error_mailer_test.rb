require 'test_helper'

class CartErrorMailerTest < ActionMailer::TestCase
  test "cart_error" do
    mail = CartErrorMailer.cart_error("Cart error")
    assert_equal "Cart error", mail.subject
    assert_equal ["nzakou.cedric@gmail.com"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Merde!!!!", mail.body.encoded
  end

end
