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

    @articles = (1..30).map do |i|
      Hashie::Mash.new({
        name: Faker::Lorem.sentence,
        body: Faker::Lorem.paragraphs(rand(1..5)).join("<br><br>"*rand(0..1)),
        read: true,
        subscription: @subscriptions.sample,
        published_at: i.days.ago,
      })
    end
  end
end
