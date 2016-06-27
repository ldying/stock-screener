class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to "/sessions/new"
    else
      flash[:errors] = @user.errors.full_messages
      errors = @user.errors.full_messages
      errors.each do  |t|
        if t == "First name can't be blank"
          flash[:first_name] = "First name can't be blank"
        end
        if t == "Last name can't be blank"  
          flash[:last_name] = "Last name can't be blank"
        end 
        if t == "Email can't be blank"  
          flash[:email] = "Last name can't be blank"
        end 
        if t == "Password can't be blank" 
          flash[:password] = "Last name can't be blank"
        end 
      end 
      redirect_to "/users/new"
    end 
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end



  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
