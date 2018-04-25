class Ad < ApplicationRecord
  belongs_to :category
  belongs_to :member

  # gem money_rails
  monetize :price_cents
end
