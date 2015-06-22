class AttendeesController < ApplicationController
  def index
     @attendees = Attendee.all
     # @attendees = Attendee.joins(:user).select("*")
     # counter = Like.where(user_id: like_params[:user_id]).count
     # @counter = Like.where(user_id: like_params[:user_id]).count
     redirect_to '/events'
  end

  def new
  end

  def create
    # user = User.find(secret_params[:id].to_i)
    @attendee = Attendee.create(event_id: attendee_params[:event_id], user_id: attendee_params[:user_id])
    redirect_to '/events'
  end

  # def counter
  #   counter Like.where(user_id: 1).count
  # end

  def show
     @attendee = Attendee.all
     redirect_to '/events'
  end

  def edit
  end

  def update
  end

  def destroy
    # Like.where(secret_id: 8, user_id: 1)
    # @like = Like.where(user_id: like_params[:user_id], secret_id: like_params[:secret_id])
    # @attendee = Attendee.find(params[:id])
    @attendee= Attendee.where(user_id: session[:user_id], event_id: params[:id]).first
    @attendee.destroy
    redirect_to '/attendees'
  end

  private
    def attendee_params
      params.require(:attendee).permit(:event_id, :user_id)
    end
end
