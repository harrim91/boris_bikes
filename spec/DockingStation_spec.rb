require "dockingstation"

describe DockingStation do
  it { expect(subject).to respond_to :release_bike }
  it { expect(subject).to respond_to(:dock).with(1).argument }
  it { expect(subject).to respond_to :bike }

  describe "#release_bike" do
    it "#release_bike returns a working docked bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to be_a Bike
      expect(subject.release_bike).to eq bike
      expect(subject.release_bike).to be_working
    end
    it "#release_bike raises an error if the dock is empty" do
      expect { subject.release_bike }.to raise_error "Docking Station is empty"
    end
  end

  describe "#dock" do
    it "#dock returns docked bike" do
      bike = Bike.new
      expect(subject.dock bike).to eq bike
    end
  end

  describe "#bike" do
    it "#bike returns the docked bike." do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bike).to eq bike
    end
  end
end
