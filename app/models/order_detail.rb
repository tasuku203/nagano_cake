class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum maiking_status: {
    impossible: 0,
    waiting: 1,
    maiking: 2,
    done: 3,
  }

end

