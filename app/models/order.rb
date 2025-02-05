class Order < ActiveRecord::Base

  belongs_to :pay_type
  accepts_nested_attributes_for :pay_type
  has_many :line_items, dependent: :destroy
  validates :name, :address, :email, presence: true
 
  
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
