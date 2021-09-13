class Rocket < ApplicationRecord
    has_one :staff
    has_many :campaigns
end
