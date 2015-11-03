module CurrentCart
  extend ActiveSupport::Concern
  
  private
  
    def set_cart
      @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
    
    def add_counter
      session[:counter].nil? ? session[:counter] = 0 : session[:counter] += 1   
    end
    
    def count_zero
      session[:counter] = 0
    end
end