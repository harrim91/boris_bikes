require "dockingstation"

describe DockingStation do
  it { expect(subject).to respond_to :release_bike }
  it "#release_bike returns a bike" do
    bike = subject.release_bike
    expect(bike).to be_a Bike
  end
end
