module EventHelper
  include StubhubHelper
  module Query

  # SEARCH

  # 1) get array of items to search for (e.g., list of NBA teams, list of festivals)
  # 2) For each item in the list, go to Stubhub and get an array of events that match that term
  # 3) For each array that comes back, filter it by the description to remove unnecessary items.
  # 4) Create and save an event object for each array


    def self.search_event(loose_query)
      @events_raw = []
      @events_raw = StubhubHelper::Event.search(loose_query)["response"]["docs"]
    end

    def self.get_event_ids(array, strict_query)
      @events_array = []
      array.each do |event|
        begin
          if event["description"].include?(strict_query) && (Date.parse(event["event_date_local"]) > Date.today)
            @events_array.push(event)
          end
        rescue => ex
          puts ex
        end
      end
      return @events_array
    end

    ## ActiveRecord Queries ##

    def search(search)
      if search
        where(["act_primary LIKE :tag", {:tag => search}])
      else
        find(:all)
      end
    end

    def most_recent
      where('created_at >= ?', DateTime.now-2)
    end    

    def less_recent
      where('created_at < ?', DateTime.now-2)
    end

    def alphabetical
      order('act_primary ASC')
    end

    def upcoming
      order('event_date_local ASC')
    end

    def cheap
      order('minPrice DESC')
    end

    # def all_less_recent
    #   where('created_at < ?', DateTime.now-1).order("created_at DESC", "act_primary ASC", "minPrice DESC")
    # end

    # def all_most_recent
    #   where('created_at >= ?', DateTime.now-1).order("event_date_local ASC", "act_primary ASC", "minPrice DESC")
    # end

    def self.cheap_less_recent(user)
      where('minPrice <= ? AND created_at < ? AND act_primary = ?', user.range_min_price, DateTime.now-1, user.fav_teams.to_s).order("event_date_local ASC", "act_primary ASC", "minPrice DESC")
    end

    def self.cheap_most_recent(user)
      where('minPrice <= ? AND created_at >= ? AND act_primary = ?', user.range_min_price, DateTime.now-1, user.fav_teams.to_s).order("event_date_local ASC", "act_primary ASC", "minPrice DESC")
    end

    def self.expensive_less_recent(user)
      where('minPrice >= ? AND created_at < ? AND act_primary = ?', user.range_max_price, DateTime.now-1, user.fav_teams.to_s).order("event_date_local ASC", "act_primary ASC", "minPrice ASC")
    end

    def self.expensive_most_recent(user)
      where('minPrice >= ? AND created_at >= ? AND act_primary = ?', user.range_max_price, DateTime.now-1, user.fav_teams.to_s).order("event_date_local ASC", "act_primary ASC", "minPrice ASC")
    end

    def self.affordable_less_recent(user)
      where('minPrice >= ? AND minPrice <= ? AND created_at < ? AND act_primary = ?', user.range_min_price, user.range_max_price, DateTime.now-1, user.fav_teams.to_s).order("event_date_local ASC", "act_primary ASC", "minPrice DESC")
    end

    def self.affordable_most_recent(user)
      where('minPrice >= ? AND minPrice <= ? AND created_at >= ? AND act_primary = ?', user.range_min_price, user.range_max_price, DateTime.now-1, user.fav_teams.to_s).order("event_date_local ASC", "act_primary ASC", "minPrice DESC")
    end

  end

end