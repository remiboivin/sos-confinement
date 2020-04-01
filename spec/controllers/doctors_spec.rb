require "rails_helper"

RSpec.describe DoctorsController, type: :controller do
  it "route /create_doctors should be routable" do
    expect(:get => "/create_doctors").to be_routable
  end
  it "route /create_doctors should be routable" do
    expect(:post => "/create_doctors").to be_routable
  end
  it "route /delete_doctors should be routable" do
    expect(:get => "/delete_doctors").to be_routable
  end
end
