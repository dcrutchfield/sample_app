FactoryGirl.define do
  factory :user do
    name                  "David Crutchfield"
    email                 "david.crutchfield@gmail.com"
    password              "foobar"
    password_confirmation "foobar"
  end
end