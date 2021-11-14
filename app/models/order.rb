class Order < ApplicationRecord
  belongs_to :end_user
  has_many :order_details
  accepts_nested_attributes_for :order_details

  enum status:{ waiting_payment: 0, checking_payment: 1, making: 2, ready_to_shipping: 3, shipped: 4 }
  enum payment_method:{ credit_card: 0, bank_transfer: 1, paypay: 2}

  def total_amount
    total_amount=0
    self.order_details.each do |order_detail|
      total_amount+=order_detail.amount
    end
    return total_amount
  end
end
