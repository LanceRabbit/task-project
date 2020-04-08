require 'rails_helper'

RSpec.feature "CreateTask", type: :feature do
  let(:user) { FactoryBot.create(:user) }

  feature "Create page is work" do
    before(:each) do
      @user_1 = user
      visit login_path
      fill_in 'session_email',    with: @user_1.email
      fill_in 'session_password', with: @user_1.password
      click_button I18n.t('views.users.login')

      visit tasks_path
      click_link I18n.t('views.tasks.add')
    end

    scenario "have Create button" do
      expect(page).to have_button I18n.t('views.create')
    end

    scenario "Create new task successfully" do
      expect do
        fill_in 'task[title]', with: 'new test task'
        fill_in 'task[content]', with: 'detail content'
        click_button I18n.t('views.create')
      end.to change { Task.count }.by(1)
    end
  end
end
