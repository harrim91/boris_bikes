require "./lib/bike.rb"

class DockingStation
  attr_accessor :docked_bikes

  def initialize
    @docked_bikes = []
  end

  def release_bike
    Bike.new
  end

  def dock(bike)
    self.docked_bikes << bike
  end


end