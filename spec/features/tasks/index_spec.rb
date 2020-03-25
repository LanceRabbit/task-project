require 'rails_helper'

RSpec.feature "Tasks", type: :feature do
  scenario "index page have one task" do
    FactoryBot.create(:task)
    visit tasks_path
    expect(page).to have_content "task-1"
  end
end
