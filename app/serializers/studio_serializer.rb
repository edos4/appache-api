class StudioSerializer < ActiveModel::Serializer
  attributes :id, :email, :address, :campaign

  def campaign
    {
      id: object.campaign.id rescue nil,
      name: object.campaign.name rescue nil
    }
  end
end
