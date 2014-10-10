class RootController < ApplicationController
  def index
    @total_unreads_count = 10
    @feeds = Feed.all

    @entries = Entry.newer
  end

  def show
    @total_unreads_count = 10
    @feeds = Feed.all

    @feed = Feed.find_by uid: params[:uid]
    @entries = @feed.entries.newer

    render "index"
  end
end
