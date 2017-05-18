class RepositoriesController < ApplicationController
    def index
        ghs = GithubService.new({access_token:session[:token]})
#        binding.pry
        @repos_array = ghs.get_repos
    end

    def create
        ghs = GithubService.new(access_token:session[:token])
        response = ghs.create_repo(session[:name])
        redirect_to '/'
    end
end
