class DashboardsController < ApplicationController
    def index
        @exercises_evaluated = Evaluation.previous_evaluations(current_user.id)
    end
end