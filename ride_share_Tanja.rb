########################################################
# Step 1: Establish the layers

# Write a list of the layers here
# I set up an array named "drivers"
# The indices of drivers array are driver1 - driver4, all hashes containing
# the :keys ride_id, pay, rating,and dates_active.
# corresponding elements were fed into an array, making the
# data structure an array of hashes with arrays as values.
#
########################################################
# Step 2: Assign a data structure to each layer
# top layer - array (4 elements)
# 2nd layer - hash (4 elements containing inside array of up to 3 elements)

# Copy your list from above, and write what data structure each layer should have
# top layer - array (4 elements) - should contain hash
# 2nd layer - hash -  4 elements containing a symbol as key and  array of up to 3 elements as value)
# values are arrays containing strings and integers.
########################################################
# Step 3: Make the data structure!

# Setup the data strcture and manually write in data presented in rides.csv

########################################################
# Step 4: Total Divers Earnings and Number of Rides

# Use an iteration block to print driver's total rides and money made


i = 0
drivers = [ # drivers array
  #index 0 of drivers array
  driver1 = {
    :ride_id => %w(RD0003 RD0015 RD0003),
    :rating => [3,4,2],
    :pay => [10,30,45],
    :dates_active => %(3rd-Feb-2016 5th-Feb-2016)
  },
  # index 1
  driver2 = {
    :ride_id => %w(RD0073 RD0013 RD0066),
    :rating => [5,1,3],
    :pay => [25,15,35],
    :dates_active => %(3rd-Feb-2016 4th-Feb-2016 5th-Feb-2016)
  },
  # index 2
  driver3 = {
    :ride_id => %w(RD0066 RD0003),
    :rating => [5,2],
    :pay => [5,50],
    :dates_active => %(4th-Feb-2016 5th-Feb-2016)
  },
  # index 3
  driver4 = {
    :ride_id => %w(RD0022 RD0022 RD0073),
    :rating => [5,4,5],
    :pay => [5,10,20],
    :dates_active => %(3rd-Feb-2016 4th-Feb-2016 5th-Feb-2016)
  }
]

puts "Here's the rundown : \n\n"

#itearate over the array to print pay, number of rides and average rating

drivers.each do |driver|
  i += 1
  puts "Driver#{i} pay: $#{driver[:pay].sum} for #{driver[:ride_id].length} rides." #calculating pay and ride number
  puts "Driver#{i}'s average rating is #{(driver[:rating].inject(0.0) { |sum, el| sum + el } / driver[:rating].size).round(2)
  }.\n\n" # calculating avg rating and rounding to 2
end
