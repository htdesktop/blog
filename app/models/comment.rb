class Comment < ActiveRecord::Base

  belongs_to :post

  belongs_to :user

  has_one :image, as: :imageable

  accepts_nested_attributes_for :image, allow_destroy: true

  validates :title, presence: true, length: { maximum: 30 }

  validates :content, presence: true, length: { maximum: 300 }
  
end
