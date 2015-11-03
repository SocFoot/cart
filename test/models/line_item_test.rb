require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  def new_product
    Product.new(title: "My Book Title",
                description: "yyy",
                price: 50,
                image_url: "image_url.jpg")
  end
  
  test "should be valid" do
    product = new_product
    assert product.valid?
  end
  
  test "should be a unique product" do
    product = Product.new(title: products(:ruby).title,
                          description: products(:ruby).description,
                          price: products(:ruby).price,
                          image_url: products(:ruby).image_url)
    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:title]
  end
end
