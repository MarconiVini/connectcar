require 'spec_helper'

describe Device do
  let(:device) {create(:device)}
  let(:device_duplicate) {build(:device, tag: device.tag)}

  it " has unique tag" do 
  	expect(device_duplicate.save).to_not be_truthy
  end
end
