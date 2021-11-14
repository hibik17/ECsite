class Address < ApplicationRecord
  belongs_to :end_user

  validates :name, presence: true
  validates :address, presence: true
  validates :zip_code, presence: true

  def address_info
    "〒#{self.zip_code} #{self.address}  #{self.name}"
  end

end
