require 'rails_helper'

RSpec.feature "Tasks", type: :feature do
  feature "Index is work" do
    scenario "index page have one task" do
      FactoryBot.create(:task)
      visit tasks_path
      expect(page).to have_content "task-1"
    end

    scenario "list task order by created time" do
      FactoryBot.create(:task,  created_at: Date.today.weeks_ago(1))
      task = FactoryBot.create(:task, :second_task, created_at: Date.today)
      visit tasks_path
      expect(
        find('table tbody tr:nth-child(1) td:nth-child(2)')
      ).to have_content(task.title)
    end
  end
end
