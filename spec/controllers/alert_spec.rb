require "rails_helper"

RSpec.describe AlertController, type: :controller do
  #   pending "add some examples to (or delete) #{__FILE__}"
  it "route /create_alert should be routable" do
    expect(:get => "/create_alert").to be_routable
  end
  it "route /create_alert should be routable" do
    expect(:post => "/create_alert").to be_routable
  end
  it "route /delete_alert should be routable" do
    expect(:get => "/delete_alert").to be_routable
  end
  it "route /gestion_attente should be routable" do
    expect(:get => "/gestion_attente").to be_routable
  end
end
