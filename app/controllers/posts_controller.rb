class PostsController < ApplicationController
  def home
  	@post = Post.page(params[:page])
  end
  
  def new  
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_param)
  	@post.save
  	@post = Post.page(params[:page])
  	render 'home'
  end

  def post_param
  	params.require(:posts).permit(:title, :content)
  end

end
