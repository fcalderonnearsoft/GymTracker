class EvaluationsController < ApplicationController
    def index
        @evaluations = Evaluation.upcoming_evaluations.order(evaluation_day: :asc).includes(:exercise)
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

    def new_register
        result = VerifyEvaluation.call(evaluation_id: params[:id])
        unless result.evaluations_user.empty?
            redirect_to evaluations_path, notice: t('evaluation.errors.evaluation-already-registered') if result.evaluations_user.first.user_id.eql? current_user.id
        end
    end

    def register
        if RegisterEvaluation.call(user_id: current_user.id, evaluation_id: params[:id], result: params[:result]).success?
            redirect_to evaluations_path, notice: t('evaluation.registered_evaluation')
        else
            redirect_to evaluations_path, notice: t('evaluation-not-registered')
        end
    end

    private
    
    def evaluation_params
        params.require(:evaluation).permit(:exercise_id, :evaluation_day, :measure_unit)
    end
end