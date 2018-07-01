class RegisterEvaluation
    include Interactor
    def call
        evaluations_user = EvaluationsUser.new(user_id: context.user_id, evaluation_id: context.evaluation_id, result: context.result)
        if evaluations_user.save
        context.evaluations_user = evaluations_user
        else
        context.fail!
        end
    end
end