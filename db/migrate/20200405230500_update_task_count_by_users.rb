class UpdateTaskCountByUsers < ActiveRecord::Migration[5.2]
  def up
    User.pluck(:id).each do |i|
      User.reset_counters(i, :tasks)
    end
  end

  def down
  end
end
