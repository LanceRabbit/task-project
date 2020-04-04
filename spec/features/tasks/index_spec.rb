require 'rails_helper'

RSpec.feature "Tasks", type: :feature do
  feature "Index is work" do
    before(:each) do
      @task_1 = FactoryBot.create(:task, created_at: Date.today.weeks_ago(1))
      @task_2 = FactoryBot.create(:task, :second_task, end_date: Date.today + 4)
      @task_3 = FactoryBot.create(:task, :completed_task, created_at: Date.today.weeks_ago(1))
      @high_task = FactoryBot.create(:task, :high_task, created_at: Date.today.weeks_ago(1))
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

    scenario "list task order by priority" do
      click_link I18n.t('views.tasks.priority_t')
      expect(
        find('table tbody tr:nth-child(1) td:nth-child(2)')
      ).to have_content(@high_task.title)
    end

    scenario "search todo tasks by title" do
      fill_in 'q[title_cont]',	with: @task_1.title
      click_button I18n.t('ransack.search')
      expect(page).to have_content(@task_1.title)
      expect(page).not_to have_content(@task_2.title)
      expect(page).not_to have_content(@task_3.title)
    end

    scenario "search completed tasks by state" do
      visit tasks_path
      select I18n.t('views.tasks.state.completed'),	from: 'q[state_eq]'
      click_button I18n.t('ransack.search')
      expect(page).to have_content(@task_3.title)
      expect(page).not_to have_content(@task_1.title)
      expect(page).not_to have_content(@task_2.title)
    end
  end
end
