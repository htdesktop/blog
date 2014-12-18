class CommentsController < ApplicationController

  load_and_authorize_resource :param_method => :comment_param, except: [:create]

  def index
    @comments = Comment.page(params[:page])
  end

  def new
    @comment = Comment.new
    @post_content = Post.find(params[:post_id]).content
    @comments_list = Post.find(params[:post_id]).comments
  end

  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.new(comment_param)
    authorize! :create, @comment
    @comment.user_id = current_user.id if logged_in?
    if @comment.save
      redirect_to(:action => 'new', :post_id => params[:post_id]) 
    else
      render :new
    end
  end

  def update
    @comment.update(comment_param)
    redirect_to(:action => 'new', :post_id => params[:post_id]) 
  end

  def destroy
    @comment.destroy
    redirect_to(:action => 'new', :post_id => params[:post_id]) 
  end
private
  def comment_param
    params.require(:comment).permit(:title, :content)
  end

end
