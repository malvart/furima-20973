class Order < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :item, dependent: :destroy
  has_one :address
end
