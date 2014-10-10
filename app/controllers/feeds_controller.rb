class FeedsController < ApplicationController
  def new
    @feed = Feed.new
  end

  def create
    @feed = Feed.create_or_update!(feed_params[:feed_url])
    redirect_to root_url
  end

  private

    def feed_params
      params.require(:feed).permit(:feed_url)
    end
end
