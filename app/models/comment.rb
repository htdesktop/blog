class Comment < ActiveRecord::Base

  belongs_to :post

  paginates_per 10

  max_paginates_per 100

  validates :content, presence: true, length: { maximum: 300 }
  
end
