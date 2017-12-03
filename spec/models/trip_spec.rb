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

  describe "Class Mehtods" do

    it "can find average duration of rides" do
      Trip.create(duration: 40, start_date: "29/8/2013 18:54", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)
      Trip.create(duration: 109, start_date: "29/8/2013 13:25", start_station_name: "Santa Clara at Almaden", end_date: "29/8/2013 13:27", end_station_name: "Adobe on Almaden", bike_id: 679, subscription: "Subscriber", zip_code: 95112)
      Trip.create(duration: 138, start_date: "29/8/2013 16:57", start_station_name: "Post at Kearney", end_date: "29/8/2013 16:59", end_station_name: "Post at Kearney", bike_id: 408, subscription: "Subscriber", zip_code: 94117)

      expect(Trip.average_duration).to eql(95)
    end

    it "can find longest ride" do
      Trip.create(duration: 40, start_date: "29/8/2013 18:54", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)
      Trip.create(duration: 109, start_date: "29/8/2013 13:25", start_station_name: "Santa Clara at Almaden", end_date: "29/8/2013 13:27", end_station_name: "Adobe on Almaden", bike_id: 679, subscription: "Subscriber", zip_code: 95112)
      Trip.create(duration: 138, start_date: "29/8/2013 16:57", start_station_name: "Post at Kearney", end_date: "29/8/2013 16:59", end_station_name: "Post at Kearney", bike_id: 408, subscription: "Subscriber", zip_code: 94117)

      expect(Trip.longest_ride).to eql(138)
    end

    it "can find shortest ride" do
      Trip.create(duration: 40, start_date: "29/8/2013 18:54", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)
      Trip.create(duration: 109, start_date: "29/8/2013 13:25", start_station_name: "Santa Clara at Almaden", end_date: "29/8/2013 13:27", end_station_name: "Adobe on Almaden", bike_id: 679, subscription: "Subscriber", zip_code: 95112)
      Trip.create(duration: 138, start_date: "29/8/2013 16:57", start_station_name: "Post at Kearney", end_date: "29/8/2013 16:59", end_station_name: "Post at Kearney", bike_id: 408, subscription: "Subscriber", zip_code: 94117)

      expect(Trip.shortest_ride).to eql(40)
    end

    it "can find popular starting station" do
      Trip.create(duration: 40, start_date: "29/8/2013 18:54", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)
      Trip.create(duration: 109, start_date: "29/8/2013 13:25", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 13:27", end_station_name: "Adobe on Almaden", bike_id: 679, subscription: "Subscriber", zip_code: 95112)
      Trip.create(duration: 138, start_date: "29/8/2013 16:57", start_station_name: "Post at Kearney", end_date: "29/8/2013 16:59", end_station_name: "Post at Kearney", bike_id: 408, subscription: "Subscriber", zip_code: 94117)

      expect(Trip.popular_starting_place).to eql("Golden Gate at Polk")
    end

    it "can find most popular ending station" do
      Trip.create(duration: 40, start_date: "29/8/2013 18:54", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)
      Trip.create(duration: 109, start_date: "29/8/2013 13:25", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 13:27", end_station_name: "Adobe on Almaden", bike_id: 679, subscription: "Subscriber", zip_code: 95112)
      Trip.create(duration: 138, start_date: "29/8/2013 16:57", start_station_name: "Post at Kearney", end_date: "29/8/2013 16:59", end_station_name: "Adobe on Almaden", bike_id: 408, subscription: "Subscriber", zip_code: 94117)

      expect(Trip.popular_ending_place).to eql("Adobe on Almaden")
    end

    it "can find most popular bike" do
      Trip.create(duration: 40, start_date: "29/8/2013 18:54", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)
      Trip.create(duration: 109, start_date: "29/8/2013 13:25", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 13:27", end_station_name: "Adobe on Almaden", bike_id: 679, subscription: "Subscriber", zip_code: 95112)
      Trip.create(duration: 138, start_date: "29/8/2013 16:57", start_station_name: "Post at Kearney", end_date: "29/8/2013 16:59", end_station_name: "Adobe on Almaden", bike_id: 679, subscription: "Subscriber", zip_code: 94117)

      expect(Trip.popular_bike).to eql(679)
    end

    it "can find most popular bikes usage" do
      Trip.create(duration: 40, start_date: "29/8/2013 18:54", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)
      Trip.create(duration: 109, start_date: "29/8/2013 13:25", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 13:27", end_station_name: "Adobe on Almaden", bike_id: 679, subscription: "Subscriber", zip_code: 95112)
      Trip.create(duration: 138, start_date: "29/8/2013 16:57", start_station_name: "Post at Kearney", end_date: "29/8/2013 16:59", end_station_name: "Adobe on Almaden", bike_id: 679, subscription: "Subscriber", zip_code: 94117)

      expect(Trip.popular_bikes_usage).to eql(2)
    end

    it "can find least popular bike" do
      Trip.create(duration: 40, start_date: "29/8/2013 18:54", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)
      Trip.create(duration: 109, start_date: "29/8/2013 13:25", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 13:27", end_station_name: "Adobe on Almaden", bike_id: 679, subscription: "Subscriber", zip_code: 95112)
      Trip.create(duration: 138, start_date: "29/8/2013 16:57", start_station_name: "Post at Kearney", end_date: "29/8/2013 16:59", end_station_name: "Adobe on Almaden", bike_id: 679, subscription: "Subscriber", zip_code: 94117)

      expect(Trip.least_popular_bike).to eql(527)
    end

    it "can find most popular ending station" do
      Trip.create(duration: 40, start_date: "29/8/2013 18:54", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)
      Trip.create(duration: 109, start_date: "29/8/2013 13:25", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 13:27", end_station_name: "Adobe on Almaden", bike_id: 679, subscription: "Subscriber", zip_code: 95112)
      Trip.create(duration: 138, start_date: "29/8/2013 16:57", start_station_name: "Post at Kearney", end_date: "29/8/2013 16:59", end_station_name: "Adobe on Almaden", bike_id: 679, subscription: "Subscriber", zip_code: 94117)

      expect(Trip.least_popular_bikes_usage).to eql(1)
    end

  end
end
