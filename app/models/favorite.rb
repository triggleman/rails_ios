class Favorite < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :image_url, presence: true
  validates :url, presence: true
  validates :rating, presence: true
  validates :display_address, presence: true
  validates :display_phone, presence: true
  validates :user_id, presence: true
  
end
