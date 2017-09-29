class StaticPagesController < ApplicationController
    # include SessionsHelper

    def home
        # if logged_in?
        # @micropost = current_user.microposts.build if logged_in?
        # @feed_items = current_user.feed.paginate(page: params[:page])
    end

    def help
    end

    def about
    end

    def contact
    end
end
