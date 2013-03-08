class Sport < ActiveRecord::Base
  include Stubhub
  include Event

  attr_accessible :title, 
                  :body, 
                  :act_primary, 
                  :act_secondary, 
                  :channel, 
                  :city, 
                  :description, 
                  :eventGeoDescription, 
                  :event_date_local, 
                  :event_time_local, 
                  :event_type, 
                  :genreUrlPath, 
                  :genre_grand_parent_id, 
                  :genre_grand_parent_name, 
                  :last_chance, 
                  :maxPrice, 
                  :maxSeatsTogether, 
                  :minPrice, 
                  :state, 
                  :totalPostings, 
                  :totalTickets, 
                  :venue_name, 
                  :espnUrlPath, 
                  :sportsTeam, 
                  :latitude, 
                  :longitude, 
                  :lat_lon

  @@event_listing = []

  def self.parse_search(array)
    array.each do |team|
      event_new = Event.new
      event_new.search_event(team)
      strict_query = team + (" Tickets")
      @@event_listing << event_new.get_event_ids(strict_query)
    end
    @@event_listing
  end

end

