class TodoItems < ActiveRecord::Migration
  def change
    rename_column :todo_items, :complete, :completed
  end
end
