class EventsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    # @events = Event.all
    @events = Event.joins(:branch).select("*")
    @branches = Branch.all
  end

  def new
    @user = User.find(session[:user_id])
    @branches = Branch.all
  end

  def create
    user = User.find(event_params[:id].to_i)
    # @event = Event.new(event_params)
    @event = Event.new(speaker: event_params[:speaker], title: event_params[:title], content: event_params[:content], date: event_params[:date], branch_id: event_params[:branch_id], avatar: event_params[:avatar], user: user)
    if @event.save
      flash[:notice] = 'New event created!'
      redirect_to @event
    else
      flash[:errors] = @event.errors.full_messages
      redirect_to new_event_path
    end

    # puts event_params
    # user = User.find(event_params[:id].to_i)
    # @event = Event.create(speaker: event_params[:speaker], title: event_params[:title], content: event_params[:content], date: event_params[:date], branch_id: event_params[:branch_id], user: user)
    # redirect_to '/events/new'
  end

  def show
    @user = User.find(session[:user_id])
    # @branches = Branch.all
    @event = Event.find(params[:id])
    # @attndees = Attendee.all
    # @attendees = Attendee.joins(:user).select("*")
    @attendees = Attendee.joins(:user).where(event_id: params[:id]).select('*')
  end

  def edit
    @user = User.find(session[:user_id])
    @branches = Branch.all
    @event = Event.find(params[:id])
  end

  def update
    @user = User.find(session[:user_id])
    @event = Event.find(params[:id])
    @event.update( event_params )
    redirect_to '/events'
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to '/events/new'
  end

  private
  def event_params
    params.require(:event).permit(:speaker, :title, :content, :date, :branch_id, :avatar, :id, :user_id)
  end
end
