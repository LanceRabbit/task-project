FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
    sequence(:email) { |n| "user_#{n}@example.com" }
    password { "12345678" }
    password_confirmation { "12345678" }

    trait :without_email do
      email { nil }
    end

    trait :invalid_email do
      email { "qwer@.c" }
    end

    trait :invalid_password do
      password { "123456" }
      password_confirmation { "123456" }
    end

    trait :invalid_password_confirmation do
      password { "12345678" }
      password_confirmation { "qazwsxed" }
    end
  end
end
