# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130307231909) do

  create_table "concerts", :force => true do |t|
    t.string   "type"
    t.string   "act_primary"
    t.string   "channel"
    t.string   "channelId"
    t.string   "city"
    t.string   "date_inhand"
    t.string   "date_last_modified"
    t.string   "date_onsale"
    t.string   "description"
    t.string   "eventGeoDescription"
    t.string   "event_date_local"
    t.string   "event_time_local"
    t.string   "genreDateDesc"
    t.string   "genre_grand_parent_id"
    t.string   "genre_parent"
    t.string   "genre_parent_name"
    t.string   "last_chance"
    t.float    "maxPrice"
    t.float    "maxSeatsTogether"
    t.float    "minPrice"
    t.float    "minSeatsTogether"
    t.string   "state"
    t.float    "totalPostings"
    t.float    "totalTickets"
    t.string   "urlpath"
    t.string   "venue_name"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "lat_lon"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "sports", :force => true do |t|
    t.string   "type"
    t.string   "act_primary"
    t.string   "act_secondary"
    t.string   "channel"
    t.string   "channelId"
    t.string   "city"
    t.string   "description"
    t.string   "eventGeoDescription"
    t.string   "event_date_local"
    t.string   "event_time_local"
    t.string   "event_type"
    t.string   "genreUrlPath"
    t.string   "genre_grand_parent_id"
    t.string   "genre_grand_parent_name"
    t.string   "ancesterGenreIds"
    t.string   "last_chance"
    t.float    "maxPrice"
    t.string   "maxSeatsTogether"
    t.float    "minPrice"
    t.string   "state"
    t.string   "totalPostings"
    t.integer  "totalTickets"
    t.string   "venue_name"
    t.string   "urlpath"
    t.string   "sportsTeam"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "lat_lon"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

end
