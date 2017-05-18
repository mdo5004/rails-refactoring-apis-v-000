class RepositoriesController < ApplicationController
    def index
        ghs = GithubService.new(session[:token])
        @repos_array = ghs.get_repos
    end

    def create
        ghs = GithubService.new(session[:token])
        response = ghs.create_repo(session[:name])
        redirect_to '/'
    end
end
