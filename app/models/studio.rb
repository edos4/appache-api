class Studio < ApplicationRecord
  belongs_to :campaign, optional: true
  has_one :studio_manager
  has_one :studio_owner
end
