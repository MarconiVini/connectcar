FactoryGirl.define do
  sequence(:email){ Faker::Internet.email }
  sequence(:cpf) {Faker::CPF.numeric}

  factory :user do
    email 
    password "12345678"
    password_confirmation "12345678"
    cpf 
  end
end