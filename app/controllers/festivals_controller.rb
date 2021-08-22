class FestivalsController < ApplicationController
  def index
    @festivals = Festival.all
    
    
    if !params[:artist_id].nil?
      @artist = Artist.find(params[:artist_id])
    else
      @artist = nil
    end
  end

  def show
    @festival = Festival.find(params[:id])
    @festivals = Festival.all
    @comment = Comment.new
    @stages = Stage.all
    @festival_times = FestivalTime.all
  end
  
  
  
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
  
end