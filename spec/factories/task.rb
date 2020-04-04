FactoryBot.define do
  factory :task do
    title { "task-1" }
    content { "task-content-1" }
    start_date { Date.today }
    end_date { Date.today + 5 }
    state { :todo }

    trait :second_task do
      title { "task-2" }
      content { "task-content-2" }
      state { :doing }
    end

    trait :completed_task do
      title { "task-3" }
      content { "task-content-3" }
      state { :completed }
    end
  end
end
