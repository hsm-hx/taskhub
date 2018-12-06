class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  def show
    set_task
  end
  def new
    @task = Task.new
  end
  def create
    @task = Task.new(task_params)

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

  private
    def set_task
      @task = Task.find(params[:id])
    end
    def task_params
      params.require(:task).permit(:title, :description, :user_id, :folder_id, :label_id, :due_day)
    end
end
