class User < ApplicationRecord
  has_many :attendances
  has_many :events
end
