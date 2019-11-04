class Event < ApplicationRecord
  belongs_to :user
  has_many :attendances
  has_many :users, through: :attendances

  validates :start_date, :duration, :title, :description, :price, :location, presence: true
  validates :duration, numericality: { only_integer: true, greater_than: 0 }
  validates :title, length: { in: 5..140 }
  validates :description, length: { in: 20..1000 }
  validates :price, numericality: { only_integer: true, greater_than: 0, less_than: 1001 }
  validate :future_event
  validate :multiple_of_five

  private

  def future_event
    # on valide que la date de départ est bien dans le futur
    errors.add(:start_date, "must be in the future") unless
    self.start_date > Time.now
  end

  def multiple_of_five
    # on vérifie que la durée est bien multiple de 5
    errors.add(:duration, "must a multiple of 5") unless
    self.duration % 5 == 0    
  end
end
