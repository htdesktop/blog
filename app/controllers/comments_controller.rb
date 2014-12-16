class CommentsController < ApplicationController

  @@post_id = 0

  def new
    @comment = Comment.new
    @@post_id = params[:post_id]
    @post_content = Post.find(params[:post_id]).content
    @comments_list = Post.find(params[:post_id]).Comment
  end

  def create
    @comment = Comment.new(commnet_param)
    @comment.post_id = @@post_id
    if logged_in?
      @comment.user_id = current_user.id
    end
    @comment.save
    @post = Post.page()
    redirect_to(:action => 'new', :post_id => @@post_id) 
  end

  def show
    
  end

  def update
    
  end

  def destroy
    
  end

  def commnet_param
    params.require(:comments).permit(:title, :content)
  end

end
