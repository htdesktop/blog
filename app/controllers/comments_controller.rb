class CommentsController < ApplicationController

  load_and_authorize_resource :param_method => :comment_param, except: [:create]

  def index
    @comments = Comment.page(params[:page])
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
    @comment.build_image
    @comments_list = Post.find(params[:post_id]).comments
  end

  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.new(comment_param)
    authorize! :create, @comment
    @comment.user_id = current_user.id if logged_in?

    respond_to do |format|

      if @comment.save
        format.html{ redirect_to(:action => 'new', :post_id => params[:post_id]) }
        format.json{ render json: @comment, status: :created, location: @comment }  
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @comment, status: :created }
        format.js
      end

    end


  end

  def update
    if @comment.update(comment_param)
      redirect_to(:action => 'new', :post_id => params[:post_id]) 
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to(:action => 'new', :post_id => params[:post_id]) 
  end

private
  def comment_param
    params.require(:comment).permit(:title, :content, image_attributes: [:path])
  end
end
