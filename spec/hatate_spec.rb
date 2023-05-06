# frozen_string_literal: true

RSpec.describe Hatate do
  it "has a version number" do
    expect(Hatate::VERSION).not_to be_nil
  end

  it "has a Rails version number" do
    expect(Hatate::RAILS_VERSION).not_to be_nil
  end
end
