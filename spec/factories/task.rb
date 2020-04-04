FactoryBot.define do
  factory :task do
    title { "task-1" }
    content { "task-content-1" }
    start_date { Date.today }
    end_date { Date.today + 5 }

    trait :second_task do
      title { "task-2" }
      content { "task-content-2" }
    end
  end
end
