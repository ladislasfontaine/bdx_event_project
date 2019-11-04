class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  after_create :creator_congrats

  def creator_congrats
    UserMailer.new_participant(self).deliver_now
  end
end
