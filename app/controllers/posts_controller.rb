class PostsController < ApplicationController
  def home
  	@post = Post.page(params[:page])
  end
  
  def new  
    if logged_in?
  	  @post = Post.new
      @post_list = current_user.Post
    else
      redirect_to(:action => 'home', :page => 1) 
    end
  end

  def create

  	@post = Post.new(post_param)
    @post.user_id = current_user.id
  	@post.save
  	@post = Post.page(params[:page])

  	redirect_to(:action => 'home', :page => 1) 

  end

  def post_param
  	params.require(:posts).permit(:title, :content)
  end

end
