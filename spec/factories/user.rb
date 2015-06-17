FactoryGirl.define do
  sequence(:cpf) {Faker::CPF.numeric}

  factory :user do
    email { Faker::Internet.email }
    password "12345678"
    password_confirmation "12345678"
    cpf 
  end
end