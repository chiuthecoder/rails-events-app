class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :branch
  has_many :joining_users, :through => :attendees, :source => :user #who joined it
  has_many :attendees
  has_many :comments
  validates :speaker, :title, :content, :date, :presence => true
  validate :expiration_date_cannot_be_in_the_past,
  def expiration_date_cannot_be_in_the_past
    errors.add(:date, "can't be in the past") if
      !date.blank? and date < Date.today
  end
  has_attached_file :avatar
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf"]
end
