class StocksController < ApplicationController
  def index
  	@user = current_user
  end

  def create_all arr 
  	arr.each do |s|
	  Stock.create(symbol: s.symbol, AverageDailyVolume:s.AverageDailyVolume, BookValue:s.BookValue, Change:s.Change, DividendShare:s.DividendShare, LastTradeDate:s.LastTradeDate, EarningsShare:s.EarningsShare, EPSEstimateCurrentYear:s.EPSEstimateCurrentYear, EPSEstimateNextYear:s.EPSEstimateNextYear, EPSEstimateNextQuarter:s.EPSEstimateNextQuarter, DaysLow:s.DaysLow, DaysHigh:s.DaysHigh, YearLow:s.YearLow, YearHigh:s.YearHigh, MarketCapitalization:s.MarketCapitalization, EBITDA:s.EBITDA, ChangeFromYearLow:s.ChangeFromYearLow, PercentChangeFromYearLow:s.PercentChangeFromYearLow, ChangeFromYearHigh:ChangeFromYearHigh, PercebtChangeFromYearHigh:s.PercebtChangeFromYearHigh, LastTradePriceOnly:s.LastTradePriceOnly, FiftydayMovingAverage:s.FiftydayMovingAverage, TwoHundreddayMovingAverage:s.TwoHundreddayMovingAverage, ChangeFromTwoHundreddayMovingAverage:s.ChangeFromTwoHundreddayMovingAverage, PercentChangeFromTwoHundreddayMovingAverage:s,PercentChangeFromTwoHundreddayMovingAverage, ChangeFromFiftydayMovingAverage:s.ChangeFromFiftydayMovingAverage, PercentChangeFromFiftydayMovingAverage:s.PercentChangeFromFiftydayMovingAverage, Name:s.Name, Open:s.Open, PreviousClose:s.PreviousClose, PriceSales:s.PriceSales, PriceBook:s.PriceBook, PERatio:s.PERatio, PEGRatio:s.PEGRatio, PriceEPSEstimateCurrentYear:s.PriceEPSEstimateCurrentYear, PriceEPSEstimateNextYear:s.PriceEPSEstimateNextYear, OneyrTargetPrice:s.OneyrTargetPrice, Volume:s.Volume, YearRange:s.YearRange, DividendYield:s.DividendYield, PercentChange:s.PercentChange) 

  	end

  end

  def update_all arr 
  	arr.each do |s|
	  Stock.find_by(symbol: s.symbol).update(AverageDailyVolume:s.AverageDailyVolume, BookValue:s.BookValue, Change:s.Change, DividendShare:s.DividendShare, LastTradeDate:s.LastTradeDate, EarningsShare:s.EarningsShare, EPSEstimateCurrentYear:s.EPSEstimateCurrentYear, EPSEstimateNextYear:s.EPSEstimateNextYear, EPSEstimateNextQuarter:s.EPSEstimateNextQuarter, DaysLow:s.DaysLow, DaysHigh:s.DaysHigh, YearLow:s.YearLow, YearHigh:s.YearHigh, MarketCapitalization:s.MarketCapitalization, EBITDA:s.EBITDA, ChangeFromYearLow:s.ChangeFromYearLow, PercentChangeFromYearLow:s.PercentChangeFromYearLow, ChangeFromYearHigh:ChangeFromYearHigh, PercebtChangeFromYearHigh:s.PercebtChangeFromYearHigh, LastTradePriceOnly:s.LastTradePriceOnly, FiftydayMovingAverage:s.FiftydayMovingAverage, TwoHundreddayMovingAverage:s.TwoHundreddayMovingAverage, ChangeFromTwoHundreddayMovingAverage:s.ChangeFromTwoHundreddayMovingAverage, PercentChangeFromTwoHundreddayMovingAverage:s,PercentChangeFromTwoHundreddayMovingAverage, ChangeFromFiftydayMovingAverage:s.ChangeFromFiftydayMovingAverage, PercentChangeFromFiftydayMovingAverage:s.PercentChangeFromFiftydayMovingAverage, Name:s.Name, Open:s.Open, PreviousClose:s.PreviousClose, PriceSales:s.PriceSales, PriceBook:s.PriceBook, PERatio:s.PERatio, PEGRatio:s.PEGRatio, PriceEPSEstimateCurrentYear:s.PriceEPSEstimateCurrentYear, PriceEPSEstimateNextYear:s.PriceEPSEstimateNextYear, OneyrTargetPrice:s.OneyrTargetPrice, Volume:s.Volume, YearRange:s.YearRange, DividendYield:s.DividendYield, PercentChange:s.PercentChange) 

  	end

  end

  def search
  end

  private
  def stock_params
    # params.require(:stock).permit(:name, :description, :pricing).merge(category: @category )
  end
end
