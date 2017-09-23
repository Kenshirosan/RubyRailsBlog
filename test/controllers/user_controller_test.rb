require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
    test "should be invalid" do
        get '/users/new'
        assert_response :success
        assert_no_difference 'User.count' do
        post '/users/', params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
        end
    end

    test "should be valid" do
        get '/users/new'
        assert_response :success
        assert_difference 'User.count' do
        post '/users/', params: { user: { name:  "Laurent",
                                         email: "example@example.com",
                                         password:              "totovaalaplage",
                                         password_confirmation: "totovaalaplage" } }
        end
        follow_redirect!
        assert_template 'users/show'
    end
end
