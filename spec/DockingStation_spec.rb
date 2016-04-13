require "dockingstation"

describe DockingStation do
  it { expect(subject).to respond_to :release_bike }
  it { expect(subject).to respond_to(:dock).with(1).argument }
  it { expect(subject).to respond_to :bike }
  it "#release_bike returns a working bike" do
    bike = subject.release_bike
    expect(bike).to be_a Bike
    expect(bike).to be_working
  end
  it "#dock returns docked bike" do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end
end
