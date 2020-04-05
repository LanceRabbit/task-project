require 'rails_helper'

RSpec.feature "ShowTask", type: :feature do
  feature "Show page is work" do
    before(:each) do
      @user = FactoryBot.create(:user)
      @task = FactoryBot.create(:task, user_id: @user.id)
      visit login_path
      fill_in 'session_email',    with: @user.email
      fill_in 'session_password', with: @user.password
      click_button I18n.t('views.users.login')

      click_link I18n.t('views.show')
    end

    scenario "see the title and content" do
      expect(page).to have_content @task.title
      expect(page).to have_content @task.content
    end

    scenario "change state from todo to doing" do
      click_link I18n.t('views.tasks.state.execute')
      @task.reload
      expect(@task.doing?).to eq(true)
    end

    scenario "change state from todo to completed" do
      click_link I18n.t('views.tasks.state.finish')
      @task.reload
      expect(@task.completed?).to eq(true)
    end
  end
end
