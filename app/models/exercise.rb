class Exercise < ApplicationRecord
    before_save :normalize_attributes
    validates_presence_of :name, :body_part
    has_many :evaluations

    private
    def normalize_attributes
        self.name = self.name.humanize.titleize
        self.body_part = self.body_part.humanize.titleize
    end
end
