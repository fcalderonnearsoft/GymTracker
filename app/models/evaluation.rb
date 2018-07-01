class Evaluation < ApplicationRecord
    belongs_to :exercise
    has_many :evaluations_user
    has_many :users, through: :evaluations_user
end
