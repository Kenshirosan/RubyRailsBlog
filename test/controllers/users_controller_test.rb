require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

    def setup
        @user = users(:laurent)
        @other_user = users(:archer)
    end

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

    test "edit path should redirect when not logged in" do
        get edit_user_path(@user)
        assert_not flash.empty?
        assert_redirected_to login_url
    end

    test "update path should redirect when not logged in" do
        patch user_path(@user), params: { user: { name: @user.name,
                                                  email: @user.email } }
        assert_not flash.empty?
        assert_redirected_to login_url
    end

    test "edit path should redirect when user tries to hack another account" do
        log_in_as(@other_user)
        get edit_user_path(@user)
        assert flash.empty?
        assert_redirected_to root_url
    end

    test "update path should redirect when user tries to hack another account" do
        log_in_as(@other_user)
        patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email } }
        assert flash.empty?
        assert_redirected_to root_url
    end

    test "users index should redirect when not logged in" do
        get users_path
        assert_redirected_to login_url
    end

    test "should not allow the admin attribute to be edited via the web" do
        log_in_as(@other_user)
        assert_not @other_user.admin?
        patch user_path(@other_user), params: {
                                        user: { password:              'tototo',
                                                password_confirmation: 'tototo',
                                                admin: 0 } }
        assert_not @other_user.admin?
    end

    #  test "should redirect destroy when not logged in" do
    #         assert_no_difference 'User.count' do
    #         delete user_path(@user)
    #     end
    #     assert_redirected_to login_url
    # end

    test "should redirect destroy when logged in as a non-admin" do
        log_in_as(@other_user)
        assert_no_difference 'User.count' do
            delete user_path(@user)
        end
        assert_redirected_to root_url
    end


end
