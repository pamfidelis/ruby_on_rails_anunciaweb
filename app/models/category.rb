class Category < ApplicationRecord
  has_many :ads

  validates_presence_of :description

  scope :order_by_description, ->(description) { order(description) }
end
