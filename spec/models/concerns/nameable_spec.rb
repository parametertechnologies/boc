require "rails_helper"

RSpec.describe Nameable do
  let(:model) { Object.new.extend(Nameable)}
  before do
    class << model
      attr_accessor :first_name, :last_name
    end
    model.first_name = "Joe"
    model.last_name = "Smith"
  end

  it "has #full_name" do
    expect(model.full_name).to eq "Joe Smith"
  end
end
