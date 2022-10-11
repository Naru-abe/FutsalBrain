class VideosController < ApplicationController
  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    @video.user_id = current_user.id
    if @video.save
      redirect_to @video
      flash[:notice] = "投稿しました"
    else
      redirect_to new_video_path
      flash[:notice] = "項目を入力してください"
    end
  end

  def index
    @videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    if @video.update(video_params)
      redirect_to @video
      flash[:notice] = "変更を完了しました"
    else
      redirect_to edit_video_path(@video)
      flash[:notice] = "項目を入力してください"
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to videos_path
    flash[:notice] = "投稿を削除しました"
  end

  private

  def video_params
    params.require(:video).permit(:title, :video, :caption)
  end
end
