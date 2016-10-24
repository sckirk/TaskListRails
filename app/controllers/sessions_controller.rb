class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:login, :create]

    def create
        auth_hash = request.env['omniauth.auth']
        redirect to login_failure_path unless auth_hash['uid']

        @user = User.find_by(uid: auth_hash[:uid], provider: 'github')
        if @user.nil?
            # User doesn't match anything in the DB.
            # Attempt to create a new user.
            @user = User.build_from_github(auth_hash)
            render :login_failure unless @user.save
        end

        # Save the user ID in the session
        session[:user_id] = @user.id

        redirect_to tasks_path
    end

    # def index
    #     @user = User.find(session[:user_id]) # < recalls the value set in a previous request
    # end

    def login; end

    def login_failure; end

    def destroy
        session.delete(:user_id)
        redirect_to login_path
    end
end
