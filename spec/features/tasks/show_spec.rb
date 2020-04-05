require 'rails_helper'

RSpec.feature "ShowTask", type: :feature do
  feature "Show page is work" do
    let(:task) { FactoryBot.create(:task) }

    before(:each) do
      @task = task
      visit tasks_path
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
