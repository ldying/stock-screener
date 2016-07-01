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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160701032259) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "follows", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "stock_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "follows", ["stock_id"], name: "index_follows_on_stock_id", using: :btree
  add_index "follows", ["user_id"], name: "index_follows_on_user_id", using: :btree

  create_table "stocks", force: :cascade do |t|
    t.string   "symbol"
    t.integer  "AverageDailyVolume"
    t.float    "BookValue"
    t.string   "Change"
    t.float    "DividendShare"
    t.string   "LastTradeDate"
    t.float    "EarningsShare"
    t.float    "EPSEstimateCurrentYear"
    t.float    "EPSEstimateNextYear"
    t.float    "EPSEstimateNextQuarter"
    t.float    "DaysLow"
    t.float    "DaysHigh"
    t.float    "YearLow"
    t.float    "YearHigh"
    t.string   "MarketCapitalization"
    t.string   "EBITDA"
    t.float    "ChangeFromYearLow"
    t.string   "PercentChangeFromYearLow"
    t.float    "ChangeFromYearHigh"
    t.string   "PercebtChangeFromYearHigh"
    t.float    "LastTradePriceOnly"
    t.float    "FiftydayMovingAverage"
    t.float    "TwoHundreddayMovingAverage"
    t.float    "ChangeFromTwoHundreddayMovingAverage"
    t.string   "PercentChangeFromTwoHundreddayMovingAverage"
    t.float    "ChangeFromFiftydayMovingAverage"
    t.string   "PercentChangeFromFiftydayMovingAverage"
    t.string   "Name"
    t.float    "Open"
    t.float    "PreviousClose"
    t.float    "PriceSales"
    t.float    "PriceBook"
    t.float    "PERatio"
    t.float    "PEGRatio"
    t.float    "PriceEPSEstimateCurrentYear"
    t.float    "PriceEPSEstimateNextYear"
    t.float    "OneyrTargetPrice"
    t.integer  "Volume"
    t.string   "YearRange"
    t.float    "DividendYield"
    t.string   "PercentChange"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.integer  "MarketCapNumber",                             limit: 8
    t.float    "EstimatedOneYearEPSGrowth"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_foreign_key "follows", "stocks"
  add_foreign_key "follows", "users"
end
