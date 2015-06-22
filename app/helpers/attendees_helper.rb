module AttendeesHelper
  def current_attendee(user_id, event_id)
    Attendee.where(user_id: user_id, event_id: event_id).first
    # mylike = @current_like
  end
end
