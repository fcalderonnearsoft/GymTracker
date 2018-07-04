class UsersController < ApplicationController

    def statistics
        @exercises_evaluated = Evaluation.joins(:evaluations_user, :exercise).where('"evaluations_users"."user_id" = ?', current_user.id)
    end
end