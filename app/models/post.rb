class Post < ActiveRecord::Base

  has_many :comments, dependent: :destroy

  belongs_to :user

  validates :title,  presence: true, length: { maximum: 50 }

  validates :content, presence: true, length: { maximum: 300 }
  
end
