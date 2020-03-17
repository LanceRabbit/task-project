class CreateTasks < ActiveRecord::Migration[5.2]
  def up
    create_table :tasks do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end

  def down
    drop_table :tasks
  end
end
