class StudioSerializer < ActiveModel::Serializer
  attributes :id, :email, :address, :created_at, :updated_at, :campaign, :studio_manager, :studio_owner

  def campaign
    {
      id: (object.campaign.id rescue nil),
      name: (object.campaign.name rescue nil)
    }
  end

  def studio_manager
    {
      data: object.studio_manager
    }
  end

  def studio_owner
    {
      data: object.studio_owner
    }
  end
end
