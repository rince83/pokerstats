# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def has_role(role)
    if @user 
      @user.roles.each {|r| 
          if r.name = role
            return true
          end
        }     
    end
    return false
  end
  
  
end
