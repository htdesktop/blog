class PostsController < ApplicationController
  def home
  	@post = Post.all
  end
  
  def new
	@post = Post.new

  end

  def create
  	@post = Post.new(post_param)
  	@post.save
  	@post = Post.all
  	render "home"
  end

  def post_param
  	params.require(:posts).permit(:title, :content)
  end

end
