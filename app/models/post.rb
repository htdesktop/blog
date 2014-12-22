class Post < ActiveRecord::Base

  has_many :comments, dependent: :destroy

  has_one :image, as: :imageable, dependent: :destroy

  belongs_to :user

  accepts_nested_attributes_for :image, allow_destroy: true

  validates :title,  presence: true, length: { maximum: 50 }

  validates :content, presence: true, length: { maximum: 300 }
  
end
