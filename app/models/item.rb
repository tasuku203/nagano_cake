class Item < ApplicationRecord
  belongs_to :genere
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy

  attachment :image
end
