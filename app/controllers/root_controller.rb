class RootController < ApplicationController
  def index
    @total_unreads_count = 10

    @feeds = Feed.all
    @entries = Entry.newer
  end
end
