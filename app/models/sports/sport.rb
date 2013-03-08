class Sport < ActiveRecord::Base
  include StubhubHelper
  include EventHelper

  attr_accessible :title,
                  :body, 
                  :type,
                  :act_primary, 
                  :act_secondary,
                  :channel, 
                  :channelId,
                  :city, 
                  :description, 
                  :eventGeoDescription, 
                  :event_date_local, 
                  :event_time_local, 
                  :event_type, 
                  :genreUrlPath, 
                  :genre_grand_parent_id, 
                  :genre_grand_parent_name, 
                  :ancestorGenreIds,
                  :last_chance, 
                  :maxPrice, 
                  :maxSeatsTogether, 
                  :minPrice, 
                  :state, 
                  :totalPostings, 
                  :totalTickets, 
                  :venue_name, 
                  :urlpath, 
                  :sportsTeam, 
                  :latitude, 
                  :longitude, 
                  :lat_lon

  @@sports_listing = []

  def self.sports_search(array)
    array.each do |team|
      sports_group = EventHelper::Query.search_event(team)
      sports = team + (" Tickets")
      @@sports_listing << EventHelper::Query.get_event_ids(sports_group, sports)
    end
    @@sports_listing
  end

  def self.get_sports(array, type)
    sports = Sport.sports_search(array)
    sports.each do |item|
      item.each do |hash|
        @sports = type.constantize.new({
          :act_primary => hash["act_primary"],                    
          :act_secondary => hash["act_secondary"],               
          :channel => hash["channel"],
          :channelId => hash["channelId"],                    
          :city => hash["city"],                       
          :description => hash["description"],                 
          :eventGeoDescription => hash["eventGeoDescription"],        
          :event_date_local => hash["event_date_local"],      
          :event_time_local => hash["event_time_local"],       
          :event_type => hash["event_type"],             
          :genreUrlPath => hash["genreUrlPath"],           
          :genre_grand_parent_id => hash["genre_grand_parent_id "], 
          :genre_grand_parent_name => hash["genre_grand_parent_name"],
          :ancestorGenreIds => hash["ancestorGenreIds"],
          :last_chance => hash["last_chance"],          
          :maxPrice => hash["maxPrice"],             
          :maxSeatsTogether => hash["maxSeatsTogether"],       
          :minPrice => hash["minPrice"],               
          :state => hash["state"],                  
          :totalPostings => hash["totalPostings"],         
          :totalTickets => hash["totalTickets"],          
          :venue_name => hash["venue_name"],            
          :urlpath => hash["urlpath"],            
          :sportsTeam => hash["sportsTeam"],            
          :latitude => hash["latitude"],              
          :longitude => hash["longitude"],            
          :lat_lon => hash["lat_lon"]
        })
        @sports.save
      end
    end
  end


end

