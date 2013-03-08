class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.string :type
      t.string :act_primary
      t.string :channel
      t.string :channelId
      t.string :city
      t.string :date_inhand
      t.string :date_last_modified
      t.string :date_onsale
      t.string :description
      t.string :eventGeoDescription
      t.string :event_date_local
      t.string :event_time_local
      t.string :genreDateDesc
      t.string :genre_grand_parent_id
      t.string :genre_parent
      t.string :genre_parent_name 
      t.string :last_chance
      t.float :maxPrice
      t.float :maxSeatsTogether 
      t.float :minPrice 
      t.float :minSeatsTogether  
      t.string :state 
      t.float :totalPostings 
      t.float :totalTickets 
      t.string :urlpath 
      t.string :venue_name 
      t.float :latitude 
      t.float :longitude 
      t.string :lat_lon 
      t.timestamps
    end
  end
end
