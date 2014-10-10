class Feed < ActiveRecord::Base
  validates :title,     presence: true
  validates :url,       presence: true
  validates :feed_url,  presence: true
  validates :uid,       presence: true

  has_many :entries,  inverse_of: :feed, dependent: :destroy

  before_validation :set_uid

  def self.create_or_update!(feed_url)
    feed = Feedjira::Feed.fetch_and_parse feed_url

    where(feed_url: feed_url).first_or_initialize.tap do |record|
      record.title  = feed.title
      record.url    = feed.url
      record.save!

      record.fetch!
    end
  end

  def to_param
    uid
  end

  def fetch!
    feed = Feedjira::Feed.fetch_and_parse feed_url

    update!({
      title:  feed.title,
      url:    feed.url,
    })

    feed.entries.each do |feed_entry|
      entries.where(url: feed_entry.url).first_or_create! do |entry|
        entry.title = feed_entry.title
        entry.created_at = feed_entry.published.to_time
        entry.updated_at = (feed_entry.updated || feed_entry.published).to_time
        entry.body = feed_entry.content || feed_entry.summary
      end
    end

    self
  end

  private

    def set_uid
      self.uid = UidGenerator.generate
    end
end
