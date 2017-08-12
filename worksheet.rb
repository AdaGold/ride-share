########################################################
# Step 1: Establish the layers
# Write a list of the layers here

=begin
LAYERS:
1. Collection of drivers' ids
2. List of rides for each driver_id
3. Data for each ride
=end

########################################################
# Step 2: Assign a data structure to each layer
# Copy your list from above, and write what data structure each layer should have

=begin
LAYERS:
1. Collection of driver's ids -> DATA STRUCTURE: HASH (KEY = driver_id number represents 1 driver; VALUE = Array that lists all rides associated w/ driver_id)
2. List of rides for each driver_id -> DATA STRUCTURE: ARRAY (Array of rides in which each hash/index = 1 ride)
3. Data for each ride -> DATA STRUCTURE: HASH

drivers = {
driver_id1: [{ride1}, {ride2}, {ride3}]
driver_id2: [{ride1}, {ride2}, {ride3}]
driver_id3: [{ride1}, {ride2}]
driver_id4: [{ride1}, {ride2}, {ride3}]
}
Note: Inside a {ride} hash
{date: "csv_date", cost: __, rider_id: "csv_id", rating: __}

=end

########################################################
# Step 3: Make the data structure!

# Setup the data strcture and manually write in data presented in rides.csv
drivers = {
  DR0001: [
    {
      date: "3rd Feb 2016",
      cost: 30,
      rider_id: "RD0015",
      rating: 4
    },
    {
      date: "3rd Feb 2016",
      cost: 10,
      rider_id: "RD0003",
      rating: 3
    },
    {
      date: "5th Feb 2016",
      cost: 45,
      rider_id: "RD0003",
      rating: 2
    }
  ],
  DR0002: [
    {
      date: "3rd Feb 2016",
      cost: 25,
      rider_id: "RD0073",
      rating: 5
    },
    {
      date: "4th Feb 2016",
      cost: 15,
      rider_id: "RD0013",
      rating: 1
    },
    {
      date: "5th Feb 2016",
      cost: 35,
      rider_id: "RD0066",
      rating: 3
    }
  ],
  DR0003: [
    {
      date: "4th Feb 2016",
      cost: 5,
      rider_id: "RD0066",
      rating: 5
    },
    {
      date: "5th Feb 2016",
      cost: 50,
      rider_id: "RD0003",
      rating: 2
    },
  ],
  DR0004: [
    {
      date: "3rd Feb 2016",
      cost: 5,
      rider_id: "RD0022",
      rating: 5
    },
    {
      date: "4th Feb 2016",
      cost: 10,
      rider_id: "RD0022",
      rating: 4
    },
    {
      date: "5th Feb 2016",
      cost: 20,
      rider_id: "RD0073",
      rating: 5
    }
  ],
}

########################################################
# Step 4: Total Drivers Earnings and Number of Rides
# Use an iteration block to print driver's total rides and money made
# If you have time, also display what the driver's average rating is.

drivers.each do |driver_id, rides_array|

  #Calculate Total Rides
  total_rides = rides_array.length

  #Calculate Money Made (and total rating)
  total_cost = 0.0
  total_rating = 0.0
  rides_array.each do |ride|
    total_cost += ride[:cost] #shorthand for: total_cost = total_cost + ride[:cost]
    total_rating += ride[:rating] #shorthand for: total_rating = total_rating + ride[:rating]
  end

  #Calculate driver's overall rating
  average_rating = total_rating / total_rides
  overall_rate = average_rating.round(2) #.round method source: https://stackoverflow.com/questions/2054217/rounding-float-in-ruby

  puts "DRIVER ID: #{driver_id} | Total Rides: #{total_rides} | Money Made: $#{total_cost} | Overall Rating:  #{overall_rate}"
end
