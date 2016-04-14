require_relative "bike"
class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def capacity
  end

  def release_bike
    raise "Docking Station is empty" if empty?
    @bikes.first
  end

  def dock(bike)
    raise "Docking station is full" if full?
    @bikes << bike
    @bikes.last
  end

  private

  def full?
    @bikes.size >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

end
