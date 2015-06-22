class CommentsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @comments = Comment.all.joins(:event).select("comment","user_","event_id")
    # @product = Product.all
  end

  def new
  end

  def create
    @comment = Comment.create( comment_params)
    redirect_to :back
  end

  def show
    @user = User.find(session[:user_id])
    # show one 
    @comments = Comment.all
    @event = Event.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    #destory from the db
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :event_id, :user_id)
  end
end
