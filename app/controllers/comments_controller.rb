class CommentsController < ApplicationController
  before_action :current_user

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = @current_user.id

    respond_to do |format|
      if @comment.save
        format.html{
          redirect_to Task.find(@comment.task_id),
          notice: "Comment was successfully posted."
        }
      else
        format.html{
          redirect_to tasks_url
        }
      end
    end
  end

  def destroy
    set_comment
    @comment.destroy

    respond_to do |format|
      format.html{
        redirect_to tasks_url,
        notice: "Comment was successfully deleted."
      }
    end
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end
  def comment_params
    params.require(:comment).permit(:body, :task_id)
  end
end
