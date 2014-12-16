class Post < ActiveRecord::Base

  has_many :Comment

  belongs_to :User

  paginates_per 10

  max_paginates_per 100

  validates :title,  presence: true, length: {maximum: 50}

  validates :content, presence: true, length: {maximum: 300}
  
end
