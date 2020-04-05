class AddUserOnTask < ActiveRecord::Migration[5.2]
  def up
    add_reference :tasks, :user, index: true
  end

  def down
    remove_column :tasks, :user_id
  end
end
