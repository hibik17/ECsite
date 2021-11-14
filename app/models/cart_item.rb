class CartItem < ApplicationRecord
  belongs_to :end_user
  belongs_to :item

  def each_item_total_price
    self.item.price*self.amount
  end
 
end
