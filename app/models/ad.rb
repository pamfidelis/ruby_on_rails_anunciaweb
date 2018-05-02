class Ad < ApplicationRecord
  belongs_to :category, counter_cache: true
  belongs_to :member

  validates :title, :category, :description, :picture, presence: true
  validates :price, numericality: { greater_than: 0 }

  scope :descending_order, ->(quantity = 6, page) { 
    limit(quantity).order(created_at: :desc).page(page).per(6) }

  scope :search_ads, ->(search, page) { 
    where("lower (title) LIKE ?", "%#{search.downcase}%").page(page).per(6) }

  scope :member_current, ->(member) { where(member: member).order(created_at: :desc) }
  scope :where_category, ->(id) { where(category: id) }

  # gem paperclip
  has_attached_file :picture,
                    styles: {large: "800x300>",
                             medium: "320x150>",
                             thumb: "100x100>" },
                    default_url: "/images/:style/missing.png"

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  # gem money_rails
  monetize :price_cents
end
