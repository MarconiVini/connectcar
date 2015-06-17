FactoryGirl.define do
  sequence(:cpf) {Faker::CPF.numeric}
  password = "12345678"

  factory :user do
    email { Faker::Internet.email }
    password password
    password_confirmation password
    account_balance 0.0
    cpf

    trait :rich do 
      account_balance 2000.0
    end
  end
end
