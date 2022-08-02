class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order
  
 def with_tax_price
   (price * 1.1).floor
 end
  
# enumにより数字に意味を持たせる
  enum making_status: {
    impossible_manufucture: 0,
    waiting_manufacture: 1,
    manufacturing: 2,
    finish: 3,
  }

end

