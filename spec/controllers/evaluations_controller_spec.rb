require "rails_helper"

RSpec.describe "evaluations page", :type => :request do

    before(:all) do
        @exercise = Exercise.create(name: Faker::RickAndMorty.character, body_part: Faker::RickAndMorty.location)
        @evaluation = Evaluation.create(exercise_id: @exercise.id, evaluation_day: Faker::Date.forward(23))

        user = User.create!(email: Faker::Internet.unique.email, password: Faker::Internet.password)
        post new_user_session_url, params: { user: { email: user.email, password: user.password } }
    end

    it "displays the evaluation index page" do
        get evaluations_url
        expect(response).to render_template(:index)
    end

    it "displays the evaluation new page" do
        get new_evaluation_url
        expect(response).to render_template(:new)
    end

    it "displays the evaluation edit page" do
        get edit_evaluation_url(@evaluation)
        expect(response).to render_template(:edit)
    end

    it "redirect to index page after edit an evaluation" do
        put evaluation_url(@evaluation), params: { evaluation: { exercise_id: @exercise.id, evaluation_day: Date.parse('20180430') } }

        expect(response).to redirect_to(evaluations_url)
    end

    it "redirect to index page after create an evaluation" do
        post evaluations_url, params: { evaluation: { exercise_id: @exercise.id, evaluation_day: Date.parse('20180620') } }
        expect(response).to redirect_to(evaluations_url)
    end


end