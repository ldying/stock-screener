class StocksController < ApplicationController
  def index
  	@user = current_user
  end

  def search
  end
end
