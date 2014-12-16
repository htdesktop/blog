class Comment < ActiveRecord::Base

  belongs_to :Post

  validates :content, presence: true, length: {maximum: 300}
  
end
