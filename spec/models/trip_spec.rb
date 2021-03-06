require 'spec_helper'

RSpec.describe Trip do
  describe "validations" do
    it "is invalid without a duration" do
      trip = Trip.create(start_date: "8/29/2013 18:54", start_station_name: "Golden Gate at Polk", end_date: "8/29/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)

      expect(trip).to be_invalid
    end

    it "is invalid without a start date" do
      trip = Trip.create(duration: 40, start_station_name: "Golden Gate at Polk", end_date: "8/29/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)

      expect(trip).to be_invalid
    end

    it "is invalid without a start station" do
      trip = Trip.create(duration: 40, start_date: "8/29/2013 18:54", end_date: "8/29/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)

      expect(trip).to be_invalid
    end

    it "is invalid without an end date" do
      trip = Trip.create(duration: 40, start_date: "8/29/2013 18:54", start_station_name: "Golden Gate at Polk", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)

      expect(trip).to be_invalid
    end

    it "is invalid without an end_station_name" do
      trip = Trip.create(duration: 40, start_date: "8/29/2013 18:54", start_station_name: "Golden Gate at Polk", end_date: "8/29/2013 18:56", bike_id: 527, subscription: "Subscriber", zip_code: 94109)


      expect(trip).to be_invalid
    end

    it "is invalid without a bike id" do
      trip = Trip.create(duration: 40, start_date: "8/29/2013 18:54", start_station_name: "Golden Gate at Polk", end_date: "8/29/2013 18:56", end_station_name: "Golden Gate at Polk", subscription: "Subscriber", zip_code: 94109)

      expect(trip).to be_invalid
    end

    it "is invalid without a subscription type" do
      trip = Trip.create(duration: 40, start_date: "8/29/2013 18:54", start_station_name: "Golden Gate at Polk", end_date: "8/29/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, zip_code: 94109)

      expect(trip).to be_invalid
    end
  end

  describe "Class Methods" do
    it "can find average duration of rides" do
      Trip.create(duration: 69, start_date: "29/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 66, end_date: "2013-08-29", end_station_name: "South Van Ness at Market", end_station_id: 66, bike_id: 520, subscription: "Subscriber", zip_code: 94127)
      Trip.create(duration: 70, start_date: "29/8/2013", start_station_name: "San Jose City Hall", start_station_id: 10, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 10, bike_id: 661, subscription: "Subscriber", zip_code: 95138)
      Trip.create(duration: 71, start_date: "29/8/2013", start_station_name: "Mountain View City Hall", start_station_id: 27, end_date: "2013-08-29", end_station_name: "Mountain View City Hall", end_station_id: 27, bike_id: 48, subscription: "Subscriber", zip_code: 97214)

      expect(Trip.average_duration).to eql(70)
    end

    it "can find longest ride" do
      Trip.create(duration: 63, start_date: "29/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 66, end_date: "2013-08-29", end_station_name: "South Van Ness at Market", end_station_id: 66, bike_id: 520, subscription: "Subscriber", zip_code: 94127)
      Trip.create(duration: 70, start_date: "29/8/2013", start_station_name: "San Jose City Hall", start_station_id: 10, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 10, bike_id: 661, subscription: "Subscriber", zip_code: 95138)
      Trip.create(duration: 71, start_date: "29/8/2013", start_station_name: "Mountain View City Hall", start_station_id: 27, end_date: "2013-08-29", end_station_name: "Mountain View City Hall", end_station_id: 27, bike_id: 48, subscription: "Subscriber", zip_code: 97214)

      expect(Trip.longest_ride).to eql(71)
    end

    it "can find shortest ride" do
      Trip.create(duration: 63, start_date: "29/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 66, end_date: "2013-08-29", end_station_name: "South Van Ness at Market", end_station_id: 66, bike_id: 520, subscription: "Subscriber", zip_code: 94127)
      Trip.create(duration: 70, start_date: "29/8/2013", start_station_name: "San Jose City Hall", start_station_id: 10, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 10, bike_id: 661, subscription: "Subscriber", zip_code: 95138)
      Trip.create(duration: 71, start_date: "29/8/2013", start_station_name: "Mountain View City Hall", start_station_id: 27, end_date: "2013-08-29", end_station_name: "Mountain View City Hall", end_station_id: 27, bike_id: 48, subscription: "Subscriber", zip_code: 97214)

      expect(Trip.shortest_ride).to eql(63)
    end

    it "can find popular starting station" do
      Station.create(name: "MLK Library", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")

      Trip.create(duration: 63, start_date: "29/8/2013", start_station_name: "MLK Library", start_station_id: 1, end_date: "2013-08-29", end_station_name: "South Van Ness at Market", end_station_id: 1, bike_id: 520, subscription: "Subscriber", zip_code: 94127)
      Trip.create(duration: 70, start_date: "29/8/2013", start_station_name: "MLK Library", start_station_id: 1, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 10, bike_id: 1, subscription: "Subscriber", zip_code: 95138)
      Trip.create(duration: 71, start_date: "29/8/2013", start_station_name: "Mountain View City Hall", start_station_id: 1, end_date: "2013-08-29", end_station_name: "Mountain View City Hall", end_station_id: 1, bike_id: 48, subscription: "Subscriber", zip_code: 97214)

      expect(Trip.popular_starting_place).to eql("MLK Library")
    end

    it "can find most popular ending station" do
      Station.create(name: "MLK Library", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")

      Trip.create(duration: 63, start_date: "29/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 1, end_date: "2013-08-29", end_station_name: "MLK Library", end_station_id: 1, bike_id: 520, subscription: "Subscriber", zip_code: 94127)
      Trip.create(duration: 70, start_date: "29/8/2013", start_station_name: "San Jose City Hall", start_station_id: 1, end_date: "2013-08-29", end_station_name: "MLK Library", end_station_id: 1, bike_id: 661, subscription: "Subscriber", zip_code: 95138)
      Trip.create(duration: 71, start_date: "29/8/2013", start_station_name: "Mountain View City Hall", start_station_id: 1, end_date: "2013-08-29", end_station_name: "MLK Library", end_station_id: 1, bike_id: 48, subscription: "Subscriber", zip_code: 97214)

      expect(Trip.popular_ending_place).to eql("MLK Library")
    end

    it "can find most popular bike" do
      Trip.create(duration: 63, start_date: "29/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 66, end_date: "2013-08-29", end_station_name: "South Van Ness at Market", end_station_id: 66, bike_id: 520, subscription: "Subscriber", zip_code: 94127)
      Trip.create(duration: 70, start_date: "29/8/2013", start_station_name: "San Jose City Hall", start_station_id: 10, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 10, bike_id: 520, subscription: "Subscriber", zip_code: 95138)
      Trip.create(duration: 71, start_date: "29/8/2013", start_station_name: "Mountain View City Hall", start_station_id: 27, end_date: "2013-08-29", end_station_name: "Mountain View City Hall", end_station_id: 27, bike_id: 48, subscription: "Subscriber", zip_code: 97214)

      expect(Trip.popular_bike).to eql(520)
    end

    it "can find most popular bikes usage" do
      Trip.create(duration: 63, start_date: "29/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 66, end_date: "2013-08-29", end_station_name: "South Van Ness at Market", end_station_id: 66, bike_id: 520, subscription: "Subscriber", zip_code: 94127)
      Trip.create(duration: 70, start_date: "29/8/2013", start_station_name: "San Jose City Hall", start_station_id: 10, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 10, bike_id: 520, subscription: "Subscriber", zip_code: 95138)
      Trip.create(duration: 71, start_date: "29/8/2013", start_station_name: "Mountain View City Hall", start_station_id: 27, end_date: "2013-08-29", end_station_name: "Mountain View City Hall", end_station_id: 27, bike_id: 48, subscription: "Subscriber", zip_code: 97214)

      expect(Trip.popular_bikes_usage).to eql(2)
    end

    it "can find least popular bike" do
      Trip.create(duration: 63, start_date: "29/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 66, end_date: "2013-08-29", end_station_name: "South Van Ness at Market", end_station_id: 66, bike_id: 520, subscription: "Subscriber", zip_code: 94127)
      Trip.create(duration: 70, start_date: "29/8/2013", start_station_name: "San Jose City Hall", start_station_id: 10, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 10, bike_id: 520, subscription: "Subscriber", zip_code: 95138)
      Trip.create(duration: 71, start_date: "29/8/2013", start_station_name: "Mountain View City Hall", start_station_id: 27, end_date: "2013-08-29", end_station_name: "Mountain View City Hall", end_station_id: 27, bike_id: 48, subscription: "Subscriber", zip_code: 97214)

      expect(Trip.least_popular_bike).to eql(48)
    end

    it "can find least popular bikes usage" do
      Trip.create(duration: 63, start_date: "29/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 66, end_date: "2013-08-29", end_station_name: "South Van Ness at Market", end_station_id: 66, bike_id: 520, subscription: "Subscriber", zip_code: 94127)
      Trip.create(duration: 70, start_date: "29/8/2013", start_station_name: "San Jose City Hall", start_station_id: 10, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 10, bike_id: 661, subscription: "Subscriber", zip_code: 95138)
      Trip.create(duration: 71, start_date: "29/8/2013", start_station_name: "Mountain View City Hall", start_station_id: 27, end_date: "2013-08-29", end_station_name: "Mountain View City Hall", end_station_id: 27, bike_id: 48, subscription: "Subscriber", zip_code: 97214)

      expect(Trip.least_popular_bikes_usage).to eql(1)
    end

    it "can count customer subscription type" do
      Trip.create(duration: 63, start_date: "29/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 66, end_date: "2013-08-29", end_station_name: "South Van Ness at Market", end_station_id: 66, bike_id: 520, subscription: "Customer", zip_code: 94127)
      Trip.create(duration: 70, start_date: "29/8/2013", start_station_name: "San Jose City Hall", start_station_id: 10, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 10, bike_id: 661, subscription: "Customer", zip_code: 95138)
      Trip.create(duration: 71, start_date: "29/8/2013", start_station_name: "Mountain View City Hall", start_station_id: 27, end_date: "2013-08-29", end_station_name: "Mountain View City Hall", end_station_id: 27, bike_id: 48, subscription: "Subscriber", zip_code: 97214)

      expect(Trip.customer_count).to eql(2)
    end

    it "can calculate customer subscription percentage" do
      Trip.create(duration: 63, start_date: "29/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 66, end_date: "2013-08-29", end_station_name: "South Van Ness at Market", end_station_id: 66, bike_id: 520, subscription: "Customer", zip_code: 94127)
      Trip.create(duration: 70, start_date: "29/8/2013", start_station_name: "San Jose City Hall", start_station_id: 10, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 10, bike_id: 661, subscription: "Subscriber", zip_code: 95138)
      Trip.create(duration: 71, start_date: "29/8/2013", start_station_name: "Mountain View City Hall", start_station_id: 27, end_date: "2013-08-29", end_station_name: "Mountain View City Hall", end_station_id: 27, bike_id: 48, subscription: "Subscriber", zip_code: 97214)

      expect(Trip.customer_percentage).to eql(33.33)
    end

    it "can count subscriber subscription type" do
      Trip.create(duration: 63, start_date: "29/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 66, end_date: "2013-08-29", end_station_name: "South Van Ness at Market", end_station_id: 66, bike_id: 520, subscription: "Customer", zip_code: 94127)
      Trip.create(duration: 70, start_date: "29/8/2013", start_station_name: "San Jose City Hall", start_station_id: 10, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 10, bike_id: 661, subscription: "Subscriber", zip_code: 95138)
      Trip.create(duration: 71, start_date: "29/8/2013", start_station_name: "Mountain View City Hall", start_station_id: 27, end_date: "2013-08-29", end_station_name: "Mountain View City Hall", end_station_id: 27, bike_id: 48, subscription: "Subscriber", zip_code: 97214)

      expect(Trip.subscriber_count).to eql(2)
    end

    it "can calculate subscriber subscription percentage" do
      Trip.create(duration: 63, start_date: "29/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 66, end_date: "2013-08-29", end_station_name: "South Van Ness at Market", end_station_id: 66, bike_id: 520, subscription: "Customer", zip_code: 94127)
      Trip.create(duration: 70, start_date: "29/8/2013", start_station_name: "San Jose City Hall", start_station_id: 10, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 10, bike_id: 661, subscription: "Subscriber", zip_code: 95138)
      Trip.create(duration: 71, start_date: "29/8/2013", start_station_name: "Mountain View City Hall", start_station_id: 27, end_date: "2013-08-29", end_station_name: "Mountain View City Hall", end_station_id: 27, bike_id: 48, subscription: "Subscriber", zip_code: 97214)

      expect(Trip.subscriber_percentage).to eql(66.67)
    end

    it "can find dates with the highest trip counts" do
      Trip.create(duration: 63, start_date: "30/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 66, end_date: "2013-08-29", end_station_name: "South Van Ness at Market", end_station_id: 66, bike_id: 520, subscription: "Subscriber", zip_code: 94127)
      Trip.create(duration: 70, start_date: "29/8/2013", start_station_name: "San Jose City Hall", start_station_id: 10, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 10, bike_id: 661, subscription: "Subscriber", zip_code: 95138)
      Trip.create(duration: 71, start_date: "29/8/2013", start_station_name: "Mountain View City Hall", start_station_id: 27, end_date: "2013-08-29", end_station_name: "Mountain View City Hall", end_station_id: 27, bike_id: 48, subscription: "Subscriber", zip_code: 97214)

      expect((Trip.date_with_highest_trips).strftime("%d/%m/%Y")).to eql("29/08/2013")
    end

    it "can find trip counts for dates with the highest count" do
      Trip.create(duration: 63, start_date: "30/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 66, end_date: "2013-08-29", end_station_name: "South Van Ness at Market", end_station_id: 66, bike_id: 520, subscription: "Subscriber", zip_code: 94127)
      Trip.create(duration: 70, start_date: "29/8/2013", start_station_name: "San Jose City Hall", start_station_id: 10, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 10, bike_id: 661, subscription: "Subscriber", zip_code: 95138)
      Trip.create(duration: 71, start_date: "29/8/2013", start_station_name: "Mountain View City Hall", start_station_id: 27, end_date: "2013-08-29", end_station_name: "Mountain View City Hall", end_station_id: 27, bike_id: 48, subscription: "Subscriber", zip_code: 97214)

      expect(Trip.highest_trip_date_count).to eql(2)
    end

    it "can find dates with the lowest trip counts" do
      Trip.create(duration: 63, start_date: "30/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 66, end_date: "2013-08-29", end_station_name: "South Van Ness at Market", end_station_id: 66, bike_id: 520, subscription: "Subscriber", zip_code: 94127)
      Trip.create(duration: 70, start_date: "29/8/2013", start_station_name: "San Jose City Hall", start_station_id: 10, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 10, bike_id: 661, subscription: "Subscriber", zip_code: 95138)
      Trip.create(duration: 71, start_date: "29/8/2013", start_station_name: "Mountain View City Hall", start_station_id: 27, end_date: "2013-08-29", end_station_name: "Mountain View City Hall", end_station_id: 27, bike_id: 48, subscription: "Subscriber", zip_code: 97214)

      expect((Trip.date_with_lowest_trips).strftime("%d/%m/%Y")).to eql("30/08/2013")
    end

    it "can find trip counts for dates with the lowest count" do
      Trip.create(duration: 63, start_date: "30/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 66, end_date: "2013-08-29", end_station_name: "South Van Ness at Market", end_station_id: 66, bike_id: 520, subscription: "Subscriber", zip_code: 94127)
      Trip.create(duration: 70, start_date: "30/8/2013", start_station_name: "San Jose City Hall", start_station_id: 10, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 10, bike_id: 661, subscription: "Subscriber", zip_code: 95138)
      Trip.create(duration: 71, start_date: "29/8/2013", start_station_name: "Mountain View City Hall", start_station_id: 27, end_date: "2013-08-29", end_station_name: "Mountain View City Hall", end_station_id: 27, bike_id: 48, subscription: "Subscriber", zip_code: 97214)

      expect(Trip.lowest_trip_date_count).to eql(1)
    end

    it "can analyze trip data by month" do
      Trip.create(duration: 63, start_date: "29/9/2013", start_station_name: "South Van Ness at Market", start_station_id: 66, end_date: "2013-08-29", end_station_name: "South Van Ness at Market", end_station_id: 66, bike_id: 520, subscription: "Subscriber", zip_code: 94127)
      Trip.create(duration: 70, start_date: "29/8/2013", start_station_name: "San Jose City Hall", start_station_id: 10, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 10, bike_id: 661, subscription: "Subscriber", zip_code: 95138)
      Trip.create(duration: 71, start_date: "29/8/2013", start_station_name: "Mountain View City Hall", start_station_id: 27, end_date: "2013-08-29", end_station_name: "Mountain View City Hall", end_station_id: 27, bike_id: 48, subscription: "Subscriber", zip_code: 97214)

      expect(Trip.month_by_month_breakdown[0].first.strftime("%B %Y")).to eql("August 2013")
      expect(Trip.month_by_month_breakdown[0].last).to eql(2)
    end

    it "can find subtotals by year" do
      Trip.create(duration: 63, start_date: "29/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 66, end_date: "2013-08-29", end_station_name: "South Van Ness at Market", end_station_id: 66, bike_id: 520, subscription: "Subscriber", zip_code: 94127)
      Trip.create(duration: 70, start_date: "29/8/2013", start_station_name: "San Jose City Hall", start_station_id: 10, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 10, bike_id: 661, subscription: "Subscriber", zip_code: 95138)
      Trip.create(duration: 71, start_date: "29/8/2013", start_station_name: "Mountain View City Hall", start_station_id: 27, end_date: "2013-08-29", end_station_name: "Mountain View City Hall", end_station_id: 27, bike_id: 48, subscription: "Subscriber", zip_code: 97214)

      expect(Trip.year_subtotals[0].first.strftime("%Y")).to eql("2013")
      expect(Trip.year_subtotals[0].last).to eql(3)
    end

  end
end
