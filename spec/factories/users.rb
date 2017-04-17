FactoryGirl.define do
  factory :user do
    first_name "MyString"
    last_name "MyString"
    email "MyString"
    password "password"
    password_confirmation "password"
    role 1
  end
end
