class RepositoriesController < ApplicationController
    def index
        ghs = GithubService.new({access_token:session[:token]})
        @repos_array = ghs.get_repos
    end

    def create
        ghs = GithubService.new(access_token:session[:token])
        response = ghs.create_repo(params[:name])
        redirect_to '/'
    end
end
