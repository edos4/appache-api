class StudioSerializer < ActiveModel::Serializer
  attributes :id, :email, :address, :campaign

  def campaign
    {
      id: object.campaign.id,
      name: object.campaign.name
    }
  end
end
