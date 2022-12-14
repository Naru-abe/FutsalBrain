class CommentsController < ApplicationController
  def create
    video = Video.find(params[:video_id])
    comment = current_user.comments.new(comment_params)
    comment.video_id = video.id
    if comment.save
      redirect_to video_path(video)
    else
      render video_path(video)
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to video_path(params[:video_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
