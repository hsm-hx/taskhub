class AddTaskToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :task_id, :integer
  end
end
