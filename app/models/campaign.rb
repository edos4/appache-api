class Campaign < ApplicationRecord
  has_many :leads
  has_many :studio
end
