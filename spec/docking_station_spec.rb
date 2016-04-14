require "docking_station"

describe DockingStation do
  it { expect(subject).to respond_to(:release_bike, :bikes, :capacity) }
  it { expect(subject).to respond_to(:dock).with(1).argument }

  describe "#release_bike" do
    it "returns a working docked bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to be_a Bike
      expect(subject.release_bike).to eq bike
      expect(subject.release_bike).to be_working
    end
    it "raises an error if the dock is empty" do
      expect { subject.release_bike }.to raise_error "Docking Station is empty"
    end
  end

  describe "#capacity" do
  	it "returns DEFAULT_CAPACITY if no capacity is given when initializing" do
  		expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
    it "returns given capacity if one is given when initializing" do
      stn = DockingStation.new 30
      expect(stn.capacity).to eq 30
    end
  end

  describe "#dock" do
    it "returns the docked bike" do
      bike = Bike.new
      expect(subject.dock bike).to eq bike
    end
    it "can store up to 20 bikes" do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock Bike.new }
      expect(subject.bikes.length).to eq DockingStation::DEFAULT_CAPACITY
    end
    it "raises an error if the dock is full" do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock Bike.new }
      expect {subject.dock Bike.new }.to raise_error "Docking station is full"
    end
  end

  describe "#bike" do
    it "returns an array." do
      subject.dock Bike.new
      expect(subject.bikes).to be_an Array
    end
    it "returns the docked bikes." do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes).to eq [bike]
    end
  end
end


