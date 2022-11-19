class PostAnimesController < ApplicationController
  def new
    @post_anime = PostAnime.new
  end

  def index
    @post_animes = PostAnime.all
  end

  def show
  end

  def create
    @post_anime = PostAnime.new(post_anime_params)
    @post_anime.user_id = current_user.id
    @post_anime.save
    redirect_to post_animes_path
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  
  def post_anime_params
    params.require(:post_anime).permit(:title, :body)
  end
end
