class HomesController < ApplicationController
  def top
    if params[:title_key]
      @post_animes = PostAnime.where('title LIKE ?', "%#{params[:title_key]}%")
    else
      @post_animes = PostAnime.all
    end
    @user = current_user
  end

  def about
  end
end
