FactoryBot.define do
  factory :user do
    sequence(:email, 1) { |n| "user_#{n}@example.com" }
    password { 'mifavoritepassword!'}
  end
end
