class SetTaskTilteNotNull < ActiveRecord::Migration[5.2]
  def up
    change_column :tasks, :title, :string, null: false
  end

  def down
    change_column :tasks, :title, :string
  end
end
