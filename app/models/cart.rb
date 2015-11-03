class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  
  def add_product(product_id)
    current_item = line_items.find_by(product_id: product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id)
    end
    current_item.price = Product.find(product_id).price
    current_item
  end
  
  def down_product(product_id)
    current_item = line_items.find_by(product_id: product_id)
    if current_item.quantity > 1
      current_item.quantity -= 1
      current_item.save
    else
      @id = current_item.product_id
      remove_item(@id)
    end
    current_item
  end
  
  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
  
  private
    def remove_item(product_id)
      current_item = line_items.find_by(product_id: product_id)
      current_item.destroy
    end
end
