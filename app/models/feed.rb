class Feed < ActiveRecord::Base
  validates :title,     presence: true
  validates :url,       presence: true
  validates :feed_url,  presence: true

  has_many :entries,  inverse_of: :feed, dependent: :destroy
end
