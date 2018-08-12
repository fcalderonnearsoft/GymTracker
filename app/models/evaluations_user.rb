class EvaluationsUser < ApplicationRecord
    belongs_to :user
    belongs_to :evaluation

    validates_presence_of :result
end
