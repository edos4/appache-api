class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :created_at, :updated_at, :role

  def role
    (object.staff.role rescue nil)
  end
end
