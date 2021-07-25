require 'rails_helper'

RSpec.describe Badge, type: :model do

  let(:valid_params) do
    {
      "issue_date" => "10/10/2020",
      "recipient_name" => "QWERTY",
      "uuid" => "e1a73bf030ea506d"
    }
  end

  it "is valid with valid attributes" do
    expect(Badge.new(valid_params)).to be_valid
  end

  it "should instantie from hash attributes" do
  end

  it "is not valid without an Issue date" do
    badge = Badge.new(valid_params.except("issue_date"))
    expect(badge).to_not be_valid
  end

  it "is not valid without an Recipient Name" do
    badge = Badge.new(valid_params.except("recipient_name"))
    expect(badge).to_not be_valid
  end

  it "is not valid without an Uuid" do
    badge = Badge.new(valid_params.except("uuid"))
    expect(badge).to_not be_valid
  end

  it "digests based on attributes" do
    badge = Badge.new(valid_params)
    # this value was calculated based on badge factory values
    expected_output = "1e00dea8e68de89f92ebb1ba92497481b75cef41c2e19d9ed68b1df11988905c"
    expect(badge.digest).to eq(expected_output)
  end
end
