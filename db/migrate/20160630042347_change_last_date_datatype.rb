class ChangeLastDateDatatype < ActiveRecord::Migration
  def change
  	change_column :stocks, :LastTradeDate, :string
  	add_column :stocks, :MarketCapNumber, :integer
  	add_column :stocks, :EstimatedOneYearEPSGrowth, :float
  end
end
