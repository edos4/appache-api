module StudiosHelper
  def self.studios_list(staff, branch_id, status)
    if staff.role == 'RFD-Records Incharge 1-A'
      vehicles = Vehicle.select{|x| x.branch.island_group == 'Mindanao'}
    else
      vehicles = Vehicle.select{|x| x}
    end
    vehicles
  end
end