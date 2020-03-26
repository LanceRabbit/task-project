require 'rails_helper'

RSpec.feature "ShowTask", type: :feature do
  let(:task) { FactoryBot.create(:task) }
  scenario "show page will see the title and content" do
    @task = task
    visit tasks_path
    # find('input[value="Show"]').click
    click_button I18n.t('views.show')
    expect(page).to have_content @task.title
    expect(page).to have_content @task.content
  end
end
