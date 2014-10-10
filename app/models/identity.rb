class Identity < ActiveRecord::Base
  validates :uid, presence: true
end
