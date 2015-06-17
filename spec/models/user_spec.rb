require 'spec_helper'

describe User do

  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  
  context "when duplicated" do
    it "should not have same emails" do
      binding.pry
      expect(user.email).not_to eq other_user.email
    end
  end

  context "when new" do
    let(:new_user) { "Ernane" }
    it "assings a new plan" do
      #expect(user.email).to eq "marcos@marcos.com"
    end
  end
end
