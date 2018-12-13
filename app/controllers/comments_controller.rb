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

  private
  def set_comment
    @comment = Comment.new
  end
  def comment_params
    params.require(:comment).permit(:body, :task_id)
  end
end
