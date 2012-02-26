# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100420003519) do

  create_table "bdrb_job_queues", :force => true do |t|
    t.text     "args"
    t.string   "worker_name"
    t.string   "worker_method"
    t.string   "job_key"
    t.integer  "taken"
    t.integer  "finished"
    t.integer  "timeout"
    t.integer  "priority"
    t.datetime "submitted_at"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "archived_at"
    t.string   "tag"
    t.string   "submitter_info"
    t.string   "runner_info"
    t.string   "worker_key"
    t.datetime "scheduled_at"
  end

  create_table "current_infos", :force => true do |t|
    t.integer  "listeners"
    t.string   "mix_icecast_title"
    t.string   "artist"
    t.string   "title"
    t.string   "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_refresh"
    t.boolean  "error_notified"
  end

  create_table "display_infos", :force => true do |t|
    t.integer  "track_id"
    t.string   "icecast_title"
    t.string   "artist"
    t.string   "title"
    t.string   "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mix_songs", :force => true do |t|
    t.integer  "mix_id"
    t.integer  "track_id"
    t.integer  "start"
    t.integer  "end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mixes", :force => true do |t|
    t.integer  "mix_id"
    t.string   "icecast_title"
    t.integer  "length"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "play_infos", :force => true do |t|
    t.integer  "track_id"
    t.integer  "listeners"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icecast_title"
    t.integer  "mix_id"
  end

end
