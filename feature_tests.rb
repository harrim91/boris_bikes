require "./lib/dockingstation"
require "./lib/bike"

stn = DockingStation.new

# As a person,
# So that I can use a bike,
# I'd like a docking station to release a bike.

bike = stn.release_bike  #=> Bike object
raise "bike is not a Bike" unless bike.class == Bike

# As a person,
# So that I can use a good bike,
# I'd like to see if a bike is working

bike.working? #=> true

# As a member of the public
# So I can return bikes I've hired
# I want to dock my bike at the docking station

bike2 = Bike.new

raise "dock does not return docked bike" unless stn.dock(bike2) == bike2

# As a member of the public
# So I can decide whether to use the docking station
# I want to see a bike that has been docked

stn.bike        #=> bike2
