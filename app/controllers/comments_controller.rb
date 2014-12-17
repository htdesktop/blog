class CommentsController < ApplicationController

  load_and_authorize_resource :param_method => :commnet_param

  @@post_id = 0

  def index
    @comment = Comment.page(params[:page])
  end

  def new
    @comment = Comment.new
    @@post_id = params[:post_id]
    @post_content = Post.find(params[:post_id]).content
    @comments_list = Post.find(params[:post_id]).comments
  end

  def create
    @comment = Comment.new(commnet_param)
    @comment.post_id = @@post_id
    @comment.user_id = current_user.id if logged_in?
    @comment.save
    redirect_to(:action => 'new', :post_id => @@post_id) 
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(commnet_param)
    redirect_to(:action => 'new', :post_id => @@post_id) 
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to(:action => 'new', :post_id => @@post_id) 
  end

  def commnet_param
    params.require(:comment).permit(:title, :content)
  end

end
