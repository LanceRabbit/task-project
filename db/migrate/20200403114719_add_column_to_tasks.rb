class AddColumnToTasks < ActiveRecord::Migration[5.2]
  def up
    add_column :tasks, :start_date, :date
    add_column :tasks, :end_date, :date
  end

  def down
    remove_column :tasks, :start_date
    remove_column :tasks, :end_date
  end
end
