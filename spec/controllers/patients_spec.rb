require "rails_helper"

RSpec.describe PatientsController, type: :controller do
  it "route /create_patients should be routable" do
    expect(:get => "/create_patients").to be_routable
  end
  it "route /create_patients should be routable" do
    expect(:post => "/create_patients").to be_routable
  end
  it "route /delete_patients should be routable" do
    expect(:get => "/delete_patients").to be_routable
  end
end
