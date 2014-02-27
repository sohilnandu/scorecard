class Scorecard < ActiveRecord::Base
  extend FriendlyId
  friendly_id :site_id

  validates_uniqueness_of :site_id

end
