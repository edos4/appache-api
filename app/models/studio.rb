class Studio < ApplicationRecord
  belongs_to :campaign, optional: true
end
