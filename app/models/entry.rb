class Entry < ActiveRecord::Base
  belongs_to :feed, inverse_of: :entries

  validates :title,   presence: true
  validates :url,     presence: true
end
