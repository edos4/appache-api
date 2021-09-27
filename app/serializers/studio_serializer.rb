class StudioSerializer < ActiveModel::Serializer
  attributes :id, :email, :address, :created_at, :updated_at, :campaign

  def campaign
    {
      id: (object.campaign.id rescue nil),
      name: (object.campaign.name rescue nil)
    }
  end
end
