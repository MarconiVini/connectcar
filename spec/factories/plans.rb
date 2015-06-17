FactoryGirl.define do
  factory :plan do
    name "Plano fixo"
	tax 9.99
	monthly_fee 9.99

	trait :fixo do 
	  tax 0.0
	  monthly_fee 15.0
	end

	trait :flex do 
	  tax 0.1
	  monthly_fee 0.0
	end
  end

end
