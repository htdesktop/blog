class Post < ActiveRecord::Base

  has_many :comments

  belongs_to :user

  paginates_per 10

  max_paginates_per 100

  validates :title,  presence: true, length: {maximum: 50}

  validates :content, presence: true, length: {maximum: 300}
  
end
