FactoryGirl.define do
  factory :user do
    email "joebloggs@test"
    password "123456"
    password_confirmation "123456"
  end
end
