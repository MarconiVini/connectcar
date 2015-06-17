require 'spec_helper'

describe Plan do
  it { should have_many(:user) }
  
  context "when 'fixo'" do
    let(:plan){create(:plan, :fixo)}
  	it "has fee" do
  	  expect(plan.monthly_fee.to_s).to eq "15.0"
   	end

    it "doesn't have tax" do
      expect(plan.tax.to_s).to eq "0.0"
    end
  end

  context "when 'flex'" do
    let(:plan){create(:plan, :flex)}
  	it "doesn't hase fee" do
  	  expect(plan.monthly_fee.to_s).to eq "0.0"
   	end

    it "has tax" do
      expect(plan.tax.to_s).to eq "0.1"
    end
  end
end
