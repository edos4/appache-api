class Campaign < ApplicationRecord
  has_many :leads
  #has_many :studios
  belongs_to :studio
end
