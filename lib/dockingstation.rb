require_relative "bike"
class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "Docking Station is empty" if @bikes.empty?
    @bikes.first
  end

  def dock(bike)
    raise "Docking station is full" if @bikes.size > 0
    @bikes << bike
    @bikes.last
  end

end
