class RootController < ApplicationController
  def index
    @feeds = Feed.all

    @entries = Entry.newer
  end

  def show
    @feeds = Feed.all

    @feed = Feed.find_by uid: params[:uid]
    @entries = @feed.entries.newer

    render "index"
  end
end
