module UsersHelper
  def display_groups(user)
    groups = ""
    if !user.group.empty?
      groups = user.group.map{ |el| el.name}.join(', ')
    end 
    groups
  end
end
