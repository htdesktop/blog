class Comment < ActiveRecord::Base

  belongs_to :post

  belongs_to :user

  validates :title, presence: true, length: { maximum: 30 }

  validates :content, presence: true, length: { maximum: 300 }
  
end
