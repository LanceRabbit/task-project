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
        new_task = Task.new(title: nil)
        expect(new_task).to be_invalid
      end
    end
  end

  describe 'search task by ransack' do
    let(:task_1) { FactoryBot.create(:task) }
    let(:task_2) { FactoryBot.create(:task, :second_task) }

    before(:each) do
      @task_1 = task_1
      @task_2 = task_2
    end

    it 'search by title' do
      q = { title_cont: @task_1.title }
      tasks = Task.ransack(q).result
      expect(tasks.first.id).to eq @task_1.id
    end

    it 'search by state' do
      q = { state_eq: @task_2.state_before_type_cast }
      tasks = Task.ransack(q).result
      expect(tasks.first.id).to eq @task_2.id
    end
  end
end
