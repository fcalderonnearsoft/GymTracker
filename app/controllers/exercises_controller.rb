class ExercisesController < ApplicationController
    def index
        @exercises = Exercise.all
    end

    def new
        @exercise = Exercise.new
    end
end