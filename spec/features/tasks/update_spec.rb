require 'rails_helper'

RSpec.feature "UpdateTask", type: :feature do
  feature "Update action is work" do
    before(:each) do
      @user = FactoryBot.create(:user)
      @task = FactoryBot.create(:task, user_id: @user.id)

      visit login_path
      fill_in 'session_email', with: @user.email
      fill_in 'session_password', with: @user.password
      click_button I18n.t('views.users.login')
    end

    scenario "update task at index page" do
      # find('input[value="Edit"]').click
      click_link I18n.t('views.edit')
      fill_in 'task[title]', with: 'update title'
      fill_in 'task[content]', with: 'change content'
      click_button I18n.t('views.update')
      expect(page).to have_content('update title')
    end

    scenario "update task at show page" do
      click_link I18n.t('views.show')
      click_link I18n.t('views.edit')
      fill_in 'task[title]', with: 'update title'
      fill_in 'task[content]', with: 'change content'
      click_button I18n.t('views.update')
      expect(page).to have_content('update title')
    end
  end
end
