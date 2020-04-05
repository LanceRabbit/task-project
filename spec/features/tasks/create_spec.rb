require 'rails_helper'

RSpec.feature "CreateTask", type: :feature do
  feature "Create page is work" do
    before(:each) do
      visit tasks_path
      click_link I18n.t('views.tasks.add')
    end

    scenario "have Create button" do
      expect(page).to have_button I18n.t('views.create')
    end

    scenario "Create new task successfully" do
      expect {
        fill_in 'task[title]',	with: 'new test task'
        fill_in 'task[content]', with: 'detail content'
        click_button I18n.t('views.create')
      }.to change{Task.count}.by(1)
    end
  end
end
