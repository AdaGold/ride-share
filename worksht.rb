# Ada C12 - Tiffany Chio
# This program analyzes driver data from a rideshare service.

# Nested hash-array-hash stores ride data for each driver.
rides = { "DR0001" => [{ date: "3rd Feb 2016", cost: 10, rider_ID: "RD0003", rating: 3 },
                      { date: "3rd Feb 2016", cost: 30, rider_ID: "RD0015", rating: 4 },
                      { date: "5th Feb 2016", cost: 45, rider_ID: "RD0003", rating: 2 }],
         "DR0002" => [{ date: "3rd Feb 2016", cost: 25, rider_ID: "RD0073", rating: 5 },
                      { date: "4th Feb 2016", cost: 15, rider_ID: "RD0013", rating: 1 },
                      { date: "5th Feb 2016", cost: 35, rider_ID: "RD0066", rating: 3 }],
         "DR0003" => [{ date: "4th Feb 2016", cost: 5, rider_ID: "RD0066", rating: 5 },
                      { date: "5th Feb 2016", cost: 50, rider_ID: "RD0003", rating: 2 }],
         "DR0004" => [{ date: "3rd Feb 2016", cost: 5, rider_ID: "RD0022", rating: 5 },
                      { date: "4th Feb 2016", cost: 10, rider_ID: "RD0022", rating: 4 },
                      { date: "5th Feb 2016", cost: 20, rider_ID: "RD0073", rating: 5 }] }

# tot_earned_hash will store all drivers' total earned amount.
# avg_rating_hash will store all drivers' average rating.
tot_earned_hash = {}
avg_rating_hash = {}

# Loops through each driver's data to calculate and print the driver's:
# number of rides given
# total amount earned
# average rating
rides.each do |driver_key, driver_value|
  total_earned = 0
  total_rating = 0

  # Loops through each ride to calculate total amount earned and total rating
  driver_value.each do |ride_hash|
    total_earned += ride_hash[:cost]
    total_rating += ride_hash[:rating]
  end

  # Average rating found by dividing total rating by the number of rides.
  avg_rating = total_rating / driver_value.length.to_f

  # Populates total amount earned hash and average rating hash for each driver.
  tot_earned_hash[driver_key] = total_earned
  avg_rating_hash[driver_key] = avg_rating

  # Prints driver stats to screen.
  # Average star rating is formatted to include only two decimal places.
  puts "Driver #{driver_key} has given #{driver_value.length}."
  puts "Driver #{driver_key} has earned a total of $#{total_earned}."
  printf("Driver %s's average rating is %.2f", driver_key, avg_rating)
  puts "\n\n"
end

# From total earned hash, max amount earned is found.
# Driver(s) that earned the max amount determined.
# Program accounts for cases in which multiple drivers have earned max amount.
max_earning = tot_earned_hash.values.max
max_earn_drivers = tot_earned_hash.select { |key, value| value == max_earning }.keys

# Prints grammatically correct statement regarding which driver earned the most.
if max_earn_drivers.length > 1
  puts "Drivers #{max_earn_drivers.reduce { |sum, n| sum + ", " + n }} made the most money: $#{max_earning}."
else
  puts "Driver #{max_earn_drivers[0]} made the most money: $#{max_earning}."
end

# From average rating hash, the highest avg rating is found.
# Driver(s) with the highest avg rating determined.
# Program accounts for cases in which multiple drivers have the highest rating.
max_avg_rating = avg_rating_hash.values.max
highest_rate_drivers = avg_rating_hash.select { |key, value| value == max_avg_rating }.keys

# Prints grammatically correct statement regarding which driver has the highest average rating.
if highest_rate_drivers.length > 1
  printf("Drivers %s has the highest average rating: %.2f.", highest_rate_drivers.reduce { |sum, n| sum + ", " + n }, max_avg_rating)
else
  printf("Driver %s has the highest average rating: %.2f.", highest_rate_drivers[0], max_avg_rating)
end

puts "\n"
