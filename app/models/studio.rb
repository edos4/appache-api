class Studio < ApplicationRecord
  belongs_to :campaign, optional: true
  has_many :campaigns
  has_one :studio_manager
  has_one :studio_owner

  def studio_leads
    data = []
    Campaign.where(studio_id: self.id).each do |e|
      data << e.leads
    end
    data
  end
end
