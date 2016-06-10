class ChangeTimeTasktimeOfTasks < ActiveRecord::Migration
  def change
    change_column :tasks, :tasktime, :integer
  end
end
