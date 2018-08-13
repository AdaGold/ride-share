=begin
another way to organize maybe is make a hash of drivers inside a hash of rides and put an array of dates, cost, rider_id and rating inside.
rides {
  {
    driver {
    driver: "DR0004",
    date: "02/03/16",
    cost: 5,
    rider_id: "RD0022",
    rating: 5
  }

}
=end

# array that stores all the data
rides =
[
  #driver 1 DR0001 is the key, array is the value
  { "DR0001": [
      # each hash is one ride
      {
        date: "02/03/16",
        cost: 10,
        rider_id: "RD0003",
        rating: 3
      },
      {
        date: "02/03/16",
        cost: 30,
        rider_id: "RD0015",
        rating: 4
      },
      {
        date: "02/05/16",
        cost: 45,
        rider_id: "RD0003",
        rating: 2
      }
    ]
  },
    #driver 2 DR0002 is the key, array is the value
  { "DR0002": [
      {
        date: "02/03/16",
        cost: 25,
        rider_id: "RD0073",
        rating: 5
      },
      {
        date: "02/04/16",
        cost: 15,
        rider_id: "RD0013",
        rating: 1
      },
      {
        date: "02/04/16",
        cost: 10,
        rider_id: "RD0022",
        rating: 4
      },
      {
        date: "02/05/16",
        cost: 35,
        rider_id: "RD0066",
        rating: 3
      }
    ]
  },

  { "DR0003": [
      {
        date: "02/04/16",
        cost: 5,
        rider_id: "RD0066",
        rating: 5
      },
      {
        date: "02/05/16",
        cost: 50,
        rider_id: "RD0003",
        rating: 2
      }
    ]
  },

  { "DR0004": [
      {
        date: "02/03/16",
        cost: 5,
        rider_id: "RD0022",
        rating: 5
      },
      {
        date: "02/05/16",
        cost: 20,
        rider_id: "RD0073",
        rating: 5
      }
    ]
  }
]


# The number of rides each driver has given
# def driver_id(rides)
 # array to store each driver
 rides.each do |drivers| # each loop to acess each driver
    each_driver = []
    each_trip = [] # array to store array of trips
      drivers.each do |driver, all_rides| # each loop to access driverID and all their rides
          each_driver << driver # pushes driver key into each_driver array
            print driver
            all_rides.each do |ride| # each loop to access each hash (each ride)
                each_trip << ride

            end
      end
      puts " #{each_trip.count} rides"
      # puts "#{each_driver}" # to see how this loops
      # return each_driver
  end
# end

# # The total amount of money each driver has made
# def find_total_earned(rides)
money_earned = [] # array to store array of trips
  rides.each do |drivers| # each loop to acess each driver
      drivers.each do |driver, all_rides| # each loop to access driverID and all their rides
      # puts "This is the first loop" #trying to understand where this loops
      # puts driver # prints each driver key in this loop
            total = 0
            all_rides.each do |ride| # each loop to access each hash (each ride)
                total += ride[:cost]
            end
            money_earned << total.to_i
            # puts "Where does this loop?"
            # puts money_earned #trying to understand where this loops
            # puts "#{total}" # to see what this loops
      end
      # puts "has earned #{money_earned}" #to see how this loops
  end

drivers = rides.each_with_index
puts drivers
money_earned.each do |money|
  puts "Driver earned $#{money}"
end


# Which driver made the most money?
most_mosty_earned = money_earned.max
puts "Driver made the most with $#{most_mosty_earned}"

# The average rating for each driver
# Which driver has the highest average rating?
