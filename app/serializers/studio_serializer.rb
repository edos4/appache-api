class StudioSerializer < ActiveModel::Serializer
  attributes :name, :id, :email, :address, :created_at, :updated_at, :campaign, :studio_manager, :studio_owner

  def campaign
    {
      id: (object.campaign.id rescue nil),
      name: (object.campaign.name rescue nil)
    }
  end

  def studio_manager
    {
      data: (object.studio_manager rescue nil),
      user: (object.studio_manager.user rescue nil)
    }
  end

  def studio_owner
    {
      data: (object.studio_owner rescue nil),
      user: (object.studio_manager.user rescue nil)
    }
  end
end
