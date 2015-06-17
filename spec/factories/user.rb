FactoryGirl.define do
  sequence(:cpf) {Faker::CPF.numeric}
  password = "12345678"

  factory :user do
    email { Faker::Internet.email }
    password password
    password_confirmation password
    cpf
  end
end
