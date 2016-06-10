class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.text :content
      t.boolean :do, default: false
      t.integer :tasktime

      t.timestamps null: false
      t.index [:user_id, :created_at]
    end
  end
end
