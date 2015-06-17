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

  context "when positive account balance" do

    let(:rich_user) { create(:user, :rich) }
    it "debits " do
      balance = rich_user.account_balance
      expect(rich_user.debit("100.00")).to eq(balance - 100.00)
    end

    it "gets the right value from database " do
      balance = rich_user.account_balance
      expect(rich_user.debit("100.00")).to eq(balance - 100.00)
      expect(User.last.account_balance.to_s).to eq((balance - 100.00).to_s)
      expect(User.last).to eq rich_user
    end

    it "credits " do
      balance = rich_user.account_balance
      expect(rich_user.credit("100.00")).to eq(balance + 100.00)
    end
  end

  context "when accout balance is 0" do
    let(:user) { create(:user)}
    it "not debits anything" do
      expect(user.debit(10.00).to_s).to eq((0.0).to_s)
      expect(user.debit(10.00)).to raise_error
    end
  end
end
