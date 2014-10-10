class RootController < ApplicationController
  def index
    @total_unreads_count = 10

    @subscriptions = (1..10).map do |i|
      Hashie::Mash.new({
        unreads_count: rand(1..100),
        feed: {
          name: Faker::Lorem.word,
          url: Faker::Internet.http_url, 
        }
      })
    end

    @entries = Entry.newer
  end
end
