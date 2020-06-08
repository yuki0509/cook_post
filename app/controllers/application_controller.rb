class ApplicationController < ActionController::Base
    helper_method :current_user
    before_action :login_required
    before_action :set_search_query

    private
        def current_user
            @curren_user ||= User.find_by(id: session[:user_id])
        end

        def login_required
            redirect_to login_path unless current_user
        end

        def set_search_query
            @q = current_user.cooks.ransack(params[:q])
        end
end
