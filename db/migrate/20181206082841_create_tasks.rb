class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.integer :user_id
      t.integer :label_id
      t.integer :folder_id
      t.date :due_day

      t.timestamps
    end
  end
end
