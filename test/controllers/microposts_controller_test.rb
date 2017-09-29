require 'test_helper'

class MicropostsControllerTest < ActionDispatch::IntegrationTest

    def setup
        @micropost = microposts(:orange)
    end

    test "should redirect when not logged in" do
        assert_no_difference 'Micropost.count' do
            post microposts_path, params: { micropost: { content: 'Lorem ipsum'} }
        end
        assert_redirected_to login_url
    end

    test "should redirect too when not logged in" do
        assert_no_difference 'Micropost.count' do
            delete micropost_path(@micropost)
        end
        assert_redirected_to login_url
    end

    test "should redirect destroy for wrong micropost" do
        log_in_as(users(:laurent))
        micropost = microposts(:ants)
        assert_no_difference 'Micropost.count' do
            delete micropost_path(micropost)
            end
        assert_redirected_to root_url
    end
end
