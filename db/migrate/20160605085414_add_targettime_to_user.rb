class AddTargettimeToUser < ActiveRecord::Migration
  def change
    add_column :users, :targettime, :integer
  end
end
