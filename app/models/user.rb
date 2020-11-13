class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :attendances
  has_many :matches, through: :attendances
  has_many :matches
  has_many :attendances_as_owner, through: :matches, source: :attendances
  has_one_attached :photo
end
