class Admin::CommentsController < Admin::BaseController
  load_and_authorize_resource :param_method => :comment_param
  
  def index
    @comments = Comment.page(params[:page])
  end

  def update
    respond_to do |format|
      if @comment.update(comment_param)
        format.html { render :show }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to admin_comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def comment_param
    params.require(:comment).permit(:title, :content)
  end
end
