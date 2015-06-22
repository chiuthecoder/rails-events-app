class UsersController < ApplicationController
  def index
    # show all users
    @users = User.all
  end

  def new #form to make new user
    @user = User.new
  end

  def create #restful route to make new user!
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:notice] = 'New user created!'
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    # show form to edit user
    @user = User.find(params[:id])
  end
  
  def update
    #send update to db
    @user = User.find(params[:id])
    @user.update( user_params )
    redirect_to '/'
  end

  def destroy
    #destory from the db
    @user = User.find(params[:id])
    @user.destroy
    redirect_to '/'
  end
  #define strong parameters!
  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :city, :state)
    end
end