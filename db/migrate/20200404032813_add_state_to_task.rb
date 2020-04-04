class AddStateToTask < ActiveRecord::Migration[5.2]
  def up
    add_column :tasks, :state, :integer, default: 0, null: false
  end

  def down
    remove_column :tasks, :state
  end
end
