class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }

  def full_address
    "〒" + postal_code + ' ' + address + ' ' + full_name
  end
end
