class Comment < ActiveRecord::Base

  belongs_to :post

  validates :content, presence: true, length: { maximum: 300 }
  
end
