class Lead < ApplicationRecord
  belongs_to :campaign, optional: true
end
