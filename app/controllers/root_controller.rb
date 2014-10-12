class RootController < ApplicationController
  def index
    @feeds = Feed.all

    @entries = Entry.newer.page params[:page]
  end

  def show
    @feeds = Feed.all

    @feed = Feed.find_by uid: params[:uid]
    @entries = @feed.entries.newer.page params[:page]

    render "index"
  end
end
