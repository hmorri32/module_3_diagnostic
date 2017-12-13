require 'rails_helper'

RSpec.describe "nrel service" do
  it "exists" do
    expect(NrelService.new).to be_a(NrelService)
  end
end