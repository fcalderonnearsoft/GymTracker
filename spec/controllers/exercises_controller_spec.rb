require "rails_helper"

RSpec.describe "exercises page", :type => :request do
    it "displays the exercise index page" do
        # user = User.create!(:username => "jdoe", :password => "secret")
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

    it "redirect to index page after create a exercise" do
        post exercises_url, params: { exercise: { name: 'Exercise test', body_part: 'Back' } }
        expect(response).to redirect_to(exercises_url)
    end
end