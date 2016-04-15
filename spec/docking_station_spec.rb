require "docking_station"

describe DockingStation do
  it { expect(subject).to respond_to(:release_bike, :bikes, :capacity) }
  it { expect(subject).to respond_to(:dock).with(1).argument }

  describe "#release_bike" do
    it "returns a working docked bike" do
      bike = double(:bike)
      subject.dock(bike)
      released_bike = subject.release_bike
      expect(released_bike).to be_a double(:Bike)
      expect(released_bike).to eq bike
      expect(released_bike).to be_working
    end

    it "raises an error if the dock is empty" do
      expect { subject.release_bike }.to raise_error "No working bikes available"
    end

    it "raises an error if there are only broken bikes" do
      bike = double(:bike)
      subject.dock bike
      bike.report_broken
      expect { subject.release_bike }.to raise_error "No working bikes available"
    end

    it "if not all bikes are broken, release the working bike" do
      working_bike = double(:bike)
      broken_bike = double(:bike)
      subject.dock(working_bike)
      subject.dock(broken_bike)
      broken_bike.report_broken
      expect(subject.release_bike).to eq working_bike
    end

    it "removes the bike from the docking station" do
      bike = double(:bike)
      subject.dock bike
      subject.release_bike
      expect(subject.bikes).not_to include bike
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
      bike = double(:bike)
      expect(subject.dock bike).to eq subject.bikes
    end
    it "can store up to defined capacity" do
      subject.capacity.times { subject.dock double(:bike) }
      expect(subject.bikes.length).to eq subject.capacity
    end
    it "raises an error if the dock is full" do
      subject.capacity.times { subject.dock double(:bike) }
      expect {subject.dock double(:bike) }.to raise_error "Docking station is full"
    end
  end

  describe "#bikes" do
    it "returns an array" do
      subject.dock double(:bike)
      expect(subject.bikes).to be_an Array
    end
    it "returns the docked bikes" do
      bike = double(:bike)
      subject.dock(bike)
      expect(subject.bikes).to eq [bike]
    end
  end
end
