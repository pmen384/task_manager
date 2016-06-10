class AddTasktimeToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :tasktime, :time
  end
end
