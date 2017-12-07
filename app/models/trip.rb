require 'will_paginate'
require 'will_paginate/active_record'

class Trip < ActiveRecord::Base
  belongs_to :start_station, class_name: "Station", foreign_key: "start_station_id", dependent: :destroy
  belongs_to :end_station, class_name: "Station", foreign_key: "end_station_id", dependent: :destroy
  belongs_to :condition, class_name: "Condition", foreign_key: "id"

  validates_presence_of :duration,
                        :start_date,
                        :start_station_id,
                        :end_date,
                        :end_station_id,
                        :bike_id,
                        :subscription

  def self.average_duration
    average(:duration).to_i
  end

  def self.longest_ride
    maximum(:duration)
  end

  def self.shortest_ride
    minimum(:duration)
  end

  def self.popular_starting_place
    Station.find(group('start_station_id').order('count(*) desc').limit(1).pluck(:start_station_id).first).name
  end

  def self.least_popular_starting_place
    Station.find(group('start_station_id').order('count(*) asc').limit(1).pluck(:start_station_id).first).name
  end

  def self.popular_ending_place
    Station.find(group('end_station_id').order('count(*) desc').limit(1).pluck(:end_station_id).first).name
  end

  def self.popular_bike
    group('bike_id').order('count(*) desc').limit(1).pluck(:bike_id).first
  end

  def self.popular_bikes_usage
    group(:bike_id).order('count_id desc').limit(1).count(:id).first[1]
  end

  def self.least_popular_bike
    group('bike_id').order('count(*) asc').limit(1).pluck(:bike_id).first
  end

  def self.least_popular_bikes_usage
    group(:bike_id).order('count_id asc').limit(1).count(:id).first[1]
  end

  def self.customer_count
    where(subscription: 'Customer').count
  end

  def self.customer_percentage
    ((self.customer_count / self.all.count.to_f)*100).round(2)
  end

  def self.subscriber_count
    where(subscription: 'Subscriber').count
  end

  def self.subscriber_percentage
    ((self.subscriber_count / self.all.count.to_f)*100).round(2)
  end

  def self.date_with_highest_trips
    group(:start_date).order('count_id desc').limit(1).count(:id).first[0]
  end

  def self.highest_trip_date_count
    group(:start_date).order('count_id desc').limit(1).count(:id).first[1]
  end

  def self.date_with_lowest_trips
    group(:start_date).order('count_id asc').limit(1).count(:id).first[0]
  end

  def self.lowest_trip_date_count
    group(:start_date).order('count_id asc').limit(1).count(:id).first[1]
  end

  def self.month_by_month_breakdown
    group("DATE_TRUNC('month', start_date)").count.to_a.sort
  end

  def self.year_subtotals
    group("DATE_TRUNC('year', start_date)").count.to_a.sort
  end

  def self.weather_on_the_day_with_the_most_rides
    Condition.find_by(date: (group(:start_date).order('count_id desc').limit(1).count(:id).first[0]))
  end

  def self.weather_on_the_day_with_the_fewest_rides
    Condition.find_by(date: (group(:start_date).order('count_id asc').limit(1).count(:id).first[0]))
  end

end
