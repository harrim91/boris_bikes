class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity

  def initialize capacity= DEFAULT_CAPACITY
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    working_bikes = @bikes.select { |bike| bike.working? }
    raise "No working bikes available" if working_bikes.empty?
    @bikes.delete(working_bikes.first)
  end

  def dock(bike)
    raise "Docking station is full" if full?
    @bikes << bike
  end

  def release_broken_bikes
    broken_bikes = @bikes.select { |bike| !bike.working? }
    @bikes.delete_if { |bike| broken_bikes.include?(bike) }
    broken_bikes
  end

  private

  def full?
    @bikes.size >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end
