class PagesController < ApplicationController
  require 'octokit'
  def home
    query_params = params[:q]
    @user_search = query_params
    find_user unless @user_search == nil
  end
  
  def find_user
    if @user_search == ""
      @error = "Attention, c'est comme un verre de bière, ce champs ne doit jamais être vide !" 
    else
      begin
        @user = Octokit.user( @user_search, :per_page => 100 )
        fetch_repos
      rescue 
        @error = "Oh erreur 404 ! Cet utilisateur n'existe pas"
      end
    end
  end
  
  def fetch_repos
    user = @user
    @repos = Octokit.repos( @user_search, :per_page => 100)
    #@repos = @user.rels[:repos].get.data
  end
  
end
