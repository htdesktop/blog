class CommentsController < ApplicationController

  load_and_authorize_resource :param_method => :comment_param

  def index
    @comment = Comment.page(params[:page])
  end

  def new
    @comment = Comment.new
    @post_content = Post.find(params[:post_id]).content
    @comments_list = Post.find(params[:post_id]).comments
  end

  def create
    @comment = Comment.new(comment_param)
    @comment.post_id = params[:post_id]
    @comment.user_id = current_user.id if logged_in?
    @comment.save
    redirect_to(:action => 'new', :post_id => params[:post_id]) 
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_param)
    redirect_to(:action => 'new', :post_id => params[:post_id]) 
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to(:action => 'new', :post_id => params[:post_id]) 
  end
private
  def comment_param
    params.require(:comment).permit(:title, :content)
  end

end
