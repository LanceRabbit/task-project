require 'rails_helper'

RSpec.feature "DestroyTask", type: :feature do
  let(:task) { FactoryBot.create(:task) }
  scenario "delete exist task" do
    task
    visit tasks_path
    expect {
      click_button I18n.t('views.delete')
    }.to change{ Task.count }.by(-1)
  end
end
