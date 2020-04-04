require 'rails_helper'

RSpec.feature "Tasks", type: :feature do
  feature "Index is work" do
    before(:each) do
      @task_1 = FactoryBot.create(:task,  created_at: Date.today.weeks_ago(1))
      @task_2 = FactoryBot.create(:task, :second_task, end_date: Date.today + 4)
      visit tasks_path
    end

    scenario "index page have one task" do
      expect(page).to have_content "task-1"
    end

    scenario "list task order by created_at" do
      click_link I18n.t('views.tasks.created_at')
      expect(
        find('table tbody tr:nth-child(1) td:nth-child(2)')
      ).to have_content(@task_2.title)
    end

    scenario "list task order by end_date" do
      click_link I18n.t('views.tasks.end_date')
      expect(
        find('table tbody tr:nth-child(1) td:nth-child(2)')
      ).to have_content(@task_1.title)
    end
  end
end
