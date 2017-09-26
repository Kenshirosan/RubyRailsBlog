require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
    def setup
        @user = users(:laurent)
    end
end
