class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :created_at, :updated_at, :role, :permissions

  def role
    (object.staff.role rescue nil)
  end

  def permissions
    classes = [Studio, Campaign]     

    permissions = { }                             

    classes.each do |clazz|                       
      policy =  Pundit.policy(current_user, clazz)      
      policy.public_methods(false).sort.each do |m|      
        result = policy.send m                   
        permissions["#{clazz}.#{m}"] = result if m != :record     
      end
    end 
    permissions
  end
end
