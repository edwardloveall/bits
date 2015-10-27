FactoryGirl.define do
  factory :user do
    name 'Logen Ninefingers'
    password 'password'
    password_confirmation 'password'
    sequence(:username) { |n| "person#{n}" }
  end
end