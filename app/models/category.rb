class Category < ApplicationRecord
  has_many :ads

  validates_presence_of :description
end
