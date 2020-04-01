require "rails_helper"

RSpec.describe HomeController, type: :controller do
  #   pending "add some examples to (or delete) #{__FILE__}"
  it "route / should be routable" do
    expect(:get => "/").to be_routable
  end
  it "route /qui_sommes_nous should be routable" do
    expect(:get => "/qui_sommes_nous").to be_routable
  end
  it "route /nous_soutenir should be routable" do
    expect(:get => "/nous_soutenir").to be_routable
  end
  it "route /nous_contacter should be routable" do
    expect(:get => "/nous_contacter").to be_routable
  end
end
