class Evaluation < ApplicationRecord
    belongs_to :exercise
    has_many :evaluations_user
    has_many :users, through: :evaluations_user

    def self.upcoming_evaluations
        where('evaluation_day >= ?', Date.today)
    end

    def self.previous_evaluations user_id
        evaluations = Hash.new
        joins(:evaluations_user, :exercise).where('"evaluations_users"."user_id" = ?', 1).each do |evaluation|
            if evaluations.key?(evaluation.exercise.name)
                evaluations[evaluation.exercise.name] << evaluation
            else
                evaluations[evaluation.exercise.name] = [evaluation]
            end
        end
        evaluations
    end
end
