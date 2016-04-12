require "docking_station"

describe DockingStation do
  it {is_expected.to respond_to(:release_bike)}
  it {is_expected.to respond_to(:dock).with(1).argument}
  it {is_expected.to respond_to(:docked_bikes)}

  it "releases a working bike" do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it "can dock a bike" do
    bike = subject.release_bike
    subject.dock(bike)
    expect(subject.docked_bikes).to include bike
  end
end