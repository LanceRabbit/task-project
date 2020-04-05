FactoryBot.define do
  factory :task do
    title { "task-1" }
    content { "task-content-1" }
    start_date { Date.today }
    end_date { Date.today + 5 }
    state { :todo }
    priority { :low }
    association :user

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

    trait :high_task do
      title { "high-task" }
      priority { :high }
    end

    trait :medium_task do
      title { "medium-task" }
      priority { :medium }
    end
  end
end
