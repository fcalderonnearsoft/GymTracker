class ExercisesController < ApplicationController
    def index
        @exercises = Exercise.all
    end

    def new
        @exercise = Exercise.new
    end

    def create
        @exercise = Exercise.new(exercise_params)

        if @exercise.save
            redirect_to exercises_path, notice: t('exercise.exercise-successfuly-created')
        else
            redirect_to new_exercise_path, notice: t('exercise.errors.exercise-not-created')
        end
    end

    private
    
    def exercise_params
        params.require(:exercise).permit(:name, :body_part)
    end
end