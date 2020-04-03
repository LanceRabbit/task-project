require 'rails_helper'
RSpec.describe Task, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
  end

  describe 'validate task columns' do
    let(:task) { FactoryBot.create(:task) }

    context "pass the validations" do
      it 'title is not blank' do
        task
        expect(task).to be_valid
      end
    end

    context "fails validation " do
      it 'title is blank' do
        new_task = Task.new(title:nil)
        expect(new_task).to be_invalid
      end
    end
  end
end