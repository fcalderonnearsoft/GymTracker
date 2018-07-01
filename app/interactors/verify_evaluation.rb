class VerifyEvaluation
      include Interactor
    def call
        evaluations_user = EvaluationsUser.where(evaluation_id: context.evaluation_id)
        context.evaluations_user = evaluations_user
    end
end