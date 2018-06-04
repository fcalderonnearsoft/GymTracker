class EvaluationsController < ApplicationController
    def index
        @evaluations = Evaluation.order(evaluation_day: :asc).includes(:exercise)
    end

    def new
        @evaluation = Evaluation.new
    end

    def create
        @evaluation = Evaluation.new(evaluation_params)

        if @evaluation.save
            flash[:success] = t('evaluation.evaluation-successfuly-created')
            redirect_to evaluations_path
        else
            flash[:error] = t('evaluation.errors.evaluation-not-created')
            redirect_to new_evaluation_path
        end
    end

    def edit
        @evaluation = Evaluation.find(params[:id])
    end

    def update
        @evaluation = Evaluation.find(params[:id])
        if @evaluation.update(evaluation_params)
            redirect_to evaluations_path, notice: t('evaluation.evaluation-successfuly-updated')
        else
            redirect_to edit_evaluation_path, notice: t('evaluation.evaluation-not-updated')
        end
    end

    def destroy
        @evaluation = Evaluation.find(params[:id])

        @evaluation.destroy
        flash[:success] = t('evaluation.evaluation-successfuly-deleted')
        redirect_to evaluations_path
    end

    private
    
    def evaluation_params
        params.require(:evaluation).permit(:exercise_id, :evaluation_day)
    end
end