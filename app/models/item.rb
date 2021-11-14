class Item < ApplicationRecord
  attachment :image
  belongs_to :genre

  has_many :cart_items
  has_many :order_details

  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true
  validates :genre_id, presence: true
  
  def self.search(search)
    if search
      Item.where(["name LIKE ?", "%#{search}%"])
    else
      Item.all
    end
  end
end
