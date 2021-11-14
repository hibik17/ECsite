class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum production_status:{ not_startable: 0, waiting_for_production: 1, producting: 2, producted: 3}
end
