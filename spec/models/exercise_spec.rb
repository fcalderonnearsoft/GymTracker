require "rails_helper"

RSpec.describe Exercise, :type => :model do
  context "with name or body part empty" do
    it "should not be valid exercise if name is empty" do
        exercise = Exercise.new body_part: 'back', name: nil
        expect(exercise).to be_invalid
    end

    it "should not be valid exercise if body part is empty" do
        exercise = Exercise.new body_part: nil, name: 'new exercise'
        expect(exercise).to be_invalid
    end
  end

  context "with name and body part filled" do
    it "should be a valid exercise" do
        exercise = Exercise.new body_part: 'back', name: 'new exercise'
        expect(exercise).to be_valid
    end
  end
end