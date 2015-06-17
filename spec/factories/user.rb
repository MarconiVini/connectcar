FactoryGirl.define do
  sequence(:email){|n| "person#{n}@example.com" }

  factory :user do
    email "marcos@marcos.com"
    password "12345678"
    password_confirmation "12345678"
  end
end