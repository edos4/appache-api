module StudiosHelper
  def self.studios_list(user)
    if user.role == 'Studio Owner'
      studios = [user.studio_owner.studio]
    elsif user.role == 'admin'
      studios = Studio.all.order(created_at: :desc, updated_at: :desc)
    end
    studios
  end
end