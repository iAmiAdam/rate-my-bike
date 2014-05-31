require 'spec_helper'

describe Bike do
  before { @bike = Bike.new(make: "Cervelo", model: "S2", name: "Race Bike", description: "Only for Summer", category: 1, user_id: 1)  }

  subject { @bike }

  it { should respond_to(:make) }
  it { should respond_to(:model) }
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:category) }
  it { should respond_to(:user_id) }
end
