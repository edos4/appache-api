FactoryBot.define do
  factory :user do
    sequence(:email, 10) { |n| "tester#{n}@test.com" }
    password { 'EasyPassword123' }
  end
end
