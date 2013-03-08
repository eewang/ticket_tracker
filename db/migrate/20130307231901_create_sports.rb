class CreateSports < ActiveRecord::Migration
  def change
    create_table :sports do |t|
      t.string :type
      t.string :act_primary
      t.string :act_secondary
      t.string :channel
      t.string :channelId
      t.string :city
      t.string :description
      t.string :eventGeoDescription
      t.string :event_date_local
      t.string :event_time_local
      t.string :event_type
      t.string :genreUrlPath
      t.string :genre_grand_parent_id
      t.string :genre_grand_parent_name
      t.string :ancesterGenreIds
      t.string :last_chance
      t.float :maxPrice
      t.string :maxSeatsTogether 
      t.float :minPrice 
      t.string :state 
      t.string :totalPostings 
      t.integer :totalTickets 
      t.string :venue_name 
      t.string :urlpath
      t.string :sportsTeam 
      t.string :latitude 
      t.string :longitude 
      t.string :lat_lon 
      t.timestamps
    end
  end
end
