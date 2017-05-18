class SessionsController < ApplicationController
    skip_before_action :authenticate_user, only: :create

    def create
        ghs = GithubService.new
        ghs.authenticate!(ENV["GITHUB_CLIENT"], ENV["GITHUB_SECRET"], params[:code])
        session[:username] = ghs.get_username

        redirect_to '/'
    end
end