class Ad < ApplicationRecord
  belongs_to :category
  belongs_to :member

  validates_presence_of :title, :category, :price, :description, :picture

  scope :descending_order, -> (quantity = 6) { limit(quantity).order(created_at: :desc)}
  scope :member_current, -> (member) { where(member: member).order(created_at: :desc)}

  # gem paperclip
  has_attached_file :picture, styles: { medium: "320x150>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  # gem money_rails
  monetize :price_cents
end
