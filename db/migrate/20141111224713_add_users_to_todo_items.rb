
class AddUsersToTodoItems < ActiveRecord::Migration
  def change
  	change_table :todo_items do |table|
  		table.integer :user_id
  	end
  end
end
