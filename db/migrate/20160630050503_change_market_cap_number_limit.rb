class ChangeMarketCapNumberLimit < ActiveRecord::Migration
  def change
  	change_column :stocks, :MarketCapNumber, :integer, :limit => 8
  end
end
