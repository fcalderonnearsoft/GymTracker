class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :evaluations_user
  has_many :evaluations, through: :evaluations_user

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
