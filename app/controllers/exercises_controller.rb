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
            flash[:success] = t('exercise.exercise-successfuly-created')
            redirect_to exercises_path
        else
            flash[:error] = t('exercise.errors.exercise-not-created')
            redirect_to new_exercise_path
        end
    end

    def edit
        @exercise = Exercise.find(params[:id])
    end

    def update
        @exercise = Exercise.find(params[:id])
        if @exercise.update(exercise_params)
            redirect_to exercises_path, notice: t('exercise.exercise-successfuly-updated')
        else
            redirect_to edit_exercise_path, notice: t('exercise.exercise-not-updated')
        end
    end

    def destroy
        @exercise = Exercise.find(params[:id])

        @exercise.destroy
        flash[:success] = t('exercise.exercise-successfuly-deleted')
        redirect_to exercises_path
    end

    private
    
    def exercise_params
        params.require(:exercise).permit(:name, :body_part)
    end
end