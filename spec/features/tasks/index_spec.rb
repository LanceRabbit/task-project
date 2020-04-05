require 'rails_helper'

RSpec.feature "Tasks", type: :feature do
  before(:each) do
    @user_1 = FactoryBot.create(:user)
    @user_2 = FactoryBot.create(:user)
    @task_1 = FactoryBot.create(:task, user_id: @user_1.id, created_at: Date.today.weeks_ago(1))
    @task_2 = FactoryBot.create(:task, :second_task, user_id: @user_1.id, end_date: Date.today + 4)
    @task_3 = FactoryBot.create(:task, :completed_task, user_id: @user_1.id, created_at: Date.today.weeks_ago(1))
    @task_4 = FactoryBot.create(:task, title: "user2-task" , user_id: @user_2.id, created_at: Date.today.weeks_ago(1))
    @high_task = FactoryBot.create(:task, :high_task, user_id: @user_1.id, created_at: Date.today.weeks_ago(1))
  end

  feature "Index working with login" do
    before(:each) do
      visit login_path
      fill_in 'session_email',    with: @user_1.email
      fill_in 'session_password', with: @user_1.password
      click_button I18n.t('views.users.login')

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

  feature "login other account" do
    before(:each) do
      visit login_path
      fill_in 'session_email',    with: @user_2.email
      fill_in 'session_password', with: @user_2.password
      click_button I18n.t('views.users.login')

      visit tasks_path
    end

    scenario "only show tasks that owner is themself" do
      expect(page).to have_content @task_4.title
      expect(page).to have_no_content @task_1.title
    end
  end

  feature "without login" do
    scenario "redirect to login path" do
      visit tasks_path
      expect(page).to have_current_path(login_path)
    end
  end
end
