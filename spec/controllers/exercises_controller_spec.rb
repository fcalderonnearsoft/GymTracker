require "rails_helper"

RSpec.describe "exercises page", :type => :request do

    before(:all) do
        @exercise = Exercise.create(name: 'Test exercise 1', body_part: 'Test body_part')

        user = User.create!(:email => "test@user.com", :password => "secret")
        post new_user_session_url, params: { user: { email: "test@user.com", password: "secret" } }
    end

    it "displays the exercise index page" do
        get exercises_url
        expect(response).to render_template(:index)

        # This will be used once we implement devise
        # get "/login"
        # assert_select "form.login" do
        # assert_select "input[name=?]", "username"
        # assert_select "input[name=?]", "password"
        # assert_select "input[type=?]", "submit"
        # end

        # post "/login", :username => "jdoe", :password => "secret"
        # assert_select ".header .username", :text => "jdoe"
    end

    it "displays the exercise new page" do
        get new_exercise_url
        expect(response).to render_template(:new)
    end

    it "displays the exercise edit page" do
        get edit_exercise_url(@exercise)
        expect(response).to render_template(:edit)
    end

    it "redirect to index page after edit an exercise" do
        put exercise_url(@exercise), params: { exercise: { name: 'Exercise In Test', body_part: 'Leg', } }

        expect(response).to redirect_to(exercises_url)
    end

    it "redirect to index page after create an exercise" do
        post exercises_url, params: { exercise: { name: 'Exercise test', body_part: 'Back' } }
        expect(response).to redirect_to(exercises_url)
    end


end