FactoryGirl.define do
  factory :user do
    username {FFaker::Internet.user_name}
    email {FFaker::Internet.email}
    password {FFaker::Internet.password}
    confirmed_at Time.now
    role 1
  end
end
