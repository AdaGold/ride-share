########################################################
# Step 1: Establish the layers

# Write a list of the layers here

# Array of rides
# Each ride is a hash with keys as headings

########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and write what data structure each layer should have

# rides = [
#   { driver_id: "DROOOO",
#     date: "0th Mon 2000",
#     cost: 0,
#     rider_id: "RD0000",
#     rating: 0
#   }
# ]

########################################################
# Step 3: Make the data structure!

# Setup the data strcture and manually write in data presented in rides.csv

data = [
  "DR0004,3rd Feb 2016,5,RD0022,5".split(","),
  "DR0001,3rd Feb 2016,10,RD0003,3".split(","),
  "DR0002,3rd Feb 2016,25,RD0073,5".split(","),
  "DR0001,3rd Feb 2016,30,RD0015,4".split(","),
  "DR0003,4th Feb 2016,5,RD0066,5".split(","),
  "DR0004,4th Feb 2016,10,RD0022,4".split(","),
  "DR0002,4th Feb 2016,15,RD0013,1".split(","),
  "DR0003,5th Feb 2016,50,RD0003,2".split(","),
  "DR0002,5th Feb 2016,35,RD0066,3".split(","),
  "DR0004,5th Feb 2016,20,RD0073,5".split(","),
  "DR0001,5th Feb 2016,45,RD0003,2".split(",")
]

rides = Array.new

data.each do |part|
  rides << {
    driver_id: part[0],
    date: part[1],
    cost: part[2],
    rider_id: part[3],
    rating: part[4]
  }
end



########################################################
# Step 4: Total Divers Earnings and Number of Rides

# Use an iteration block to print driver's total rides and money made
drivers = Array.new

rides.each do |ride|
  drivers << {driver_id: ride[:driver_id], cost: 0, ride_count: 0}
end

drivers = drivers.uniq!

rides.each do |ride|
  drivers.each do |driver|
    if driver[:driver_id] == ride[:driver_id]
      driver[:cost] += ride[:cost].to_i
      driver[:ride_count] += 1
    end
  end
end

4.times do |i| # This method of ordering is brittle for more driver ids...
  drivers.each do |driver|
    if i + 1 == driver[:driver_id][5].to_i
      puts "Driver #{driver[:driver_id]} made $#{driver[:cost]} in #{driver[:ride_count]} rides."
    end
  end
end
