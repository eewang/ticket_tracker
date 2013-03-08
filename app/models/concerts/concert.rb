class Concert < ActiveRecord::Base

  include StubhubHelper
  include EventHelper

  attr_accessible :title, :body,
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
      concert_group = EventHelper::Query.search_event(concert)
      @@concert_listing << EventHelper::Query.get_event_ids(concert_group, concert)
    end
    @@concert_listing
  end

  def self.get_concerts(array, type)
    concerts = Concert.concert_search(array)
    concerts.each do |item|
      item.each do |hash|
        @concert = type.constantize.new({
          :act_primary => hash["act_primary"],              
          :channel => hash["channel"],                    
          :channelId => hash["channelId"],                    
          :city => hash["city"],                       
          :date_inhand => hash["date_inhand"],                       
          :date_last_modified => hash["date_last_modified"],
          :date_onsale => hash["date_onsale"],                     
          :description => hash["description"],                 
          :eventGeoDescription => hash["eventGeoDescription"],        
          :event_date_local => hash["event_date_local"],      
          :event_time_local => hash["event_time_local"],       
          :genreDateDesc => hash["genreDateDesc"],                     
          :genre_grand_parent_id => hash["genre_grand_parent_id "], 
          :genre_parent => hash["genre_parent"],
          :genre_parent_name => hash["genre_parent_name"],
          :last_chance => hash["last_chance"],          
          :maxPrice => hash["maxPrice"],             
          :maxSeatsTogether => hash["maxSeatsTogether"],       
          :minPrice => hash["minPrice"],               
          :minSeatsTogether => hash["minSeatsTogether"],               
          :state => hash["state"],                  
          :totalPostings => hash["totalPostings"],         
          :totalTickets => hash["totalTickets"],          
          :urlpath => hash["urlpath"],          
          :venue_name => hash["venue_name"],
          :latitude => hash["latitude"],              
          :longitude => hash["longitude"],            
          :lat_lon => hash["lat_lon"]
        })
        @concert.save
      end
    end
  end

end
