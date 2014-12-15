class Post < ActiveRecord::Base

  has_many :Comment

  belongs_to :User

  paginates_per 10

  max_paginates_per 100
  
end
