class TasksController < ApplicationController
  before_action :current_user

  def index
    @tasks = Task.all
  end
  def show
    set_task
    @comment = Comment.new
    @comments = Comment.where("task_id = ?", @task.id)
  end
  def new
    @task = Task.new
  end
  def create
    @task = Task.new(task_params)
    @task.user_id = @current_user.id

    respond_to do |format|
      if @task.save
        format.html{
          redirect_to @task,
          notice: "Task was successfully created."
        }
        format.json{
          render :show,
          status: :created,
          location: @task
        }
      else
        format.html{
          render :new
        }
        format.json{
          render json: @task.errors,
          status: :unprocessable_entity
        }
      end
    end
  end
  def edit
    set_task
  end
  def update
    set_task

    respond_to do |format|
      if @task.update(task_params)
        format.html{
          redirect_to @task,
          notice: "Task was successfully updated."
        }
        format.json{
          render :show,
          status: :ok,
          location: @task
        }
      else
        format.html{
          render :edit
        }
        format.json{
          render json: @task.errors,
          status: :unprocessable_entity
        }
      end
    end
  end
  def destroy
    set_task
    @task.destroy

    respond_to do |format|
      format.html{
        redirect_to tasks_url,
        notice: "Task was successfully deleted."
      }
      format.json{
        head :no_content
      }
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end
    def task_params
      params.require(:task).permit(:title, :description, :user_id, :folder_id, :label_id, :due_day)
    end
end
