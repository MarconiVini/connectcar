FactoryGirl.define do
  sequence(:tag){|n| "#{n}" }
  factory :device do
    user 
	tag 
  end

end
