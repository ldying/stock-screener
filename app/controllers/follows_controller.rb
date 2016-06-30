class FollowsController < ApplicationController
  def create
    stock = Stock.find(params[:stock_id])
  	follow = Follow.create(user: current_user, stock: stock)
  	redirect_to '/stocks' 
  end

  def destroy
  	follow = Follow.find(params[:id])
    if follow.user == current_user
      follow.destroy
  	  redirect_to '/stocks'
    else
      redirect_to '/sessions/new'
    end  
  end
end
