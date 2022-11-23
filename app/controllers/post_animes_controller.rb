class PostAnimesController < ApplicationController
  def new
    @post_anime = PostAnime.new
  end

  def index
    if params[:title_key]
      @post_animes = PostAnime.where('title LIKE ?', "%#{params[:title_key]}%")
    else
      @post_animes = PostAnime.all
    end
    @user = current_user
  end

  def show
    @post_anime = PostAnime.find(params[:id])
    @user = current_user
  end

  def create
    @post_anime = PostAnime.new(post_anime_params)
    @post_anime.user_id = current_user.id
    if @post_anime.save
      flash[:notice] = "投稿が完了しました"
      redirect_to post_animes_path
    else
      @post_animes = PostAnime.all
      @user = current_user
      render :index
    end
  end

  def edit
    @post_anime = PostAnime.find(params[:id])
    if @post_anime.user_id == current_user.id
      render :edit
    else
      redirect_to post_animes_path
    end
  end

  def update
    @post_anime = PostAnime.find(params[:id])
    if @post_anime.update(post_anime_params)
      flash[:notice] = "投稿が更新されました"
      redirect_to post_anime_path(@post_anime.id)
    else
      render :edit
    end
  end

  def destroy
    @post_anime = PostAnime.find(params[:id])
    @post_anime.destroy
    redirect_to post_animes_path
  end
  
  private
  
  def post_anime_params
    params.require(:post_anime).permit(:title, :body)
  end
end