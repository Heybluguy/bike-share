class Station < ActiveRecord::Base
  has_many :trips_leaving, class_name: "Trip", foreign_key: "start_station_id", dependent: :destroy
  has_many :trips_arriving, class_name: "Trip", foreign_key: "end_station_id", dependent: :destroy

  validates_presence_of :name,
                        :dock_count,
                        :city,
                        :installation_date

  def self.average_bikes_per_station
    average(:dock_count).to_i
  end

  def self.most_bikes
    maximum(:dock_count)
  end

  def self.with_most_bikes
    where(dock_count: Station.most_bikes)
  end

  def self.fewest_bikes
    minimum(:dock_count)
  end

  def self.with_fewest_bikes
    where(dock_count: Station.fewest_bikes)
  end

  def self.newest_install_date
    maximum(:installation_date)
  end

  def self.newest_station
    where(installation_date: Station.newest_install_date)
  end

  def self.oldest_install_date
    minimum(:installation_date)
  end

  def self.oldest_station
    where(installation_date: Station.oldest_install_date)
  end

  def number_of_trips_started_at_station
    trips_leaving.count
  end

  def number_of_trips_ending_at_station
    trips_arriving.count
  end

  def most_frequent_destination
    id = trips_leaving.group(:end_station_id).order('count(*) DESC').count(:start_station_id).first.first
    Station.find(id).name
  end

  def most_frequent_origination_station
    id = trips_arriving.group(:start_station_id).order('count(*) DESC').count(:end_station_id).first.first
    Station.find(id).name
  end

  def date_with_highest_trips_by_station
    trips_leaving.group(:start_date).order('count(*) DESC').count.first[0]
  end

  def most_frequent_user_zipcodes
     trips_leaving.group(:zip_code).order('count(*) DESC').count.first[0]
  end

  def most_frequent_bike_used
    trips_leaving.group(:bike_id).order('count(*) DESC').count.first[0]
  end
end
