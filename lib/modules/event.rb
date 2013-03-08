module Event
  include Stubhub

  class Scrape

    def self.search_event(loose_query)
      @events_raw = []
      @events_raw = Stubhub::Event.search(loose_query)["response"]["docs"]
    end

    def self.get_event_ids(strict_query)
      @events_array = []
      @events_raw.each do |event|
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

  end

  class Query

    ## ActiveRecord Queries ##

    def self.all_less_recent
      where('created_at < ?', DateTime.now-1).order("created_at DESC", "act_primary ASC", "minPrice DESC")
    end

    def self.all_most_recent
      where('created_at >= ?', DateTime.now-1).order("event_date_local ASC", "act_primary ASC", "minPrice DESC")
    end

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