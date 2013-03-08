class Concert < ActiveRecord::Base
  include Stubhub
  include Event

  attr_accessible :title, :body
    :type,
    :act_primary,
    :channel,
    :channelId,
    :city,
    :date_inhand,
    :date_last_modified,
    :date_onsale,
    :description,
    :eventGeoDescription,
    :event_date_local,
    :event_time_local,
    :genreDateDesc,
    :genre_grand_parent_id,
    :genre_parent,
    :genre_parent_name,
    :last_chance,
    :maxPrice,
    :maxSeatsTogether,
    :minPrice, 
    :minSeatsTogether,  
    :state,
    :totalPostings, 
    :totalTickets, 
    :urlpath, 
    :venue_name, 
    :latitude, 
    :longitude,
    :lat_lon 

  @@concert_listing = []

  def self.concert_search(array)
    array.each do |concert|
      concert_new = Concert.new 
      concert_new.search_event(concert)
      @@concert_listing << concert_new.get_event_ids(concert)
    end
    @@concert_listing
  end

end
