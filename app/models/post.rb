class Post < ActiveRecord::Base

  has_many:Comment

  paginates_per 10

  max_paginates_per 100
  
end
