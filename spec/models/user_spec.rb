require 'spec_helper'

describe User do	
  context "assign cpf" do 
    let(:user) { create(:user)}
    let(:user_duplicate) {build(:user, cpf: user.cpf)}
    it "accepts cpf" do
  	  expect(user).to respond_to(:cpf)
  	end

    it "should not accept duplicate cpf" do 
      
      expect(user_duplicate.save).to_not be_truthy
    end
  end
end
