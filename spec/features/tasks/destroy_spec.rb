require 'rails_helper'

RSpec.feature "DestroyTask", type: :feature do
  scenario "delete exist task" do
    @user = FactoryBot.create(:user)
    @task = FactoryBot.create(:task, user_id: @user.id)

    visit login_path
    fill_in 'session_email',    with: @user.email
    fill_in 'session_password', with: @user.password
    click_button I18n.t('views.users.login')

    expect {
      click_link I18n.t('views.delete')
    }.to change{ Task.count }.by(-1)
  end
end
