class Staff < ApplicationRecord
  belongs_to :user, optional: true
end
