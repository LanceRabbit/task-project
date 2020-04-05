FactoryBot.define do
  factory :user do
    sequence(:name) {|n| "User #{n}"}
    sequence(:email) {|n| "user_#{n}@example.com"}
  end
end
