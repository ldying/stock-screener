class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.integer :AverageDailyVolume
      t.float :BookValue
      t.string :Change
      t.float :DividendShare
      t.date :LastTradeDate
      t.float :EarningsShare
      t.float :EPSEstimateCurrentYear
      t.float :EPSEstimateNextYear
      t.float :EPSEstimateNextQuarter
      t.float :DaysLow
      t.float :DaysHigh
      t.float :YearLow
      t.float :YearHigh
      t.string :MarketCapitalization
      t.string :EBITDA
      t.float :ChangeFromYearLow
      t.string :PercentChangeFromYearLow
      t.float :ChangeFromYearHigh
      t.string :PercebtChangeFromYearHigh
      t.float :LastTradePriceOnly
      t.float :FiftydayMovingAverage
      t.float :TwoHundreddayMovingAverage
      t.float :ChangeFromTwoHundreddayMovingAverage
      t.string :PercentChangeFromTwoHundreddayMovingAverage
      t.float :ChangeFromFiftydayMovingAverage
      t.string :PercentChangeFromFiftydayMovingAverage
      t.string :Name
      t.float :Open
      t.float :PreviousClose
      t.float :PriceSales
      t.float :PriceBook
      t.float :PERatio
      t.float :PEGRatio
      t.float :PriceEPSEstimateCurrentYear
      t.float :PriceEPSEstimateNextYear
      t.float :OneyrTargetPrice
      t.integer :Volume
      t.string :YearRange
      t.float :DividendYield
      t.string :PercentChange

      t.timestamps null: false
    end
  end
end
