require 'spec_helper'

describe User do
  context "assign cpf" do
    let(:user) { create(:user)}
    let(:user_duplicate) {build(:user, cpf: user.cpf)}
    let(:user_cpf) { create(:user, cpf: "11122233344") }

    it "accepts cpf" do
  	  expect(user).to respond_to(:cpf)
  	end

    it "should not accept duplicate cpf" do
      expect(user_duplicate.save).to_not be_truthy
    end

    it "Formats CPF" do
      expect(user_cpf.formated_cpf).to eq "111.222.333-44"
    end

    it "Not changes the original CPF" do
      expect(user_cpf.formated_cpf).not_to eq user_cpf.cpf
    end
  end
end
