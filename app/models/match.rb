class Match < ApplicationRecord
  belongs_to :user
  has_many :attendances
end
