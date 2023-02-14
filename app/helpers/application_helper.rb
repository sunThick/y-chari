module ApplicationHelper
  def active_class(link_path)
    current_page?(link_path) ? "border fw-bolder bg-white" : "fw-light"
  end


  def current_username
    if current_user.present?
      id = current_user.id
      profile = Profile.find_by(user_id: id)
      if !profile.nil?
        return profile.username
      end
    end
  end

  def profile_photo
    if current_user
      "/#{current_username}"
    else
      new_account_path
    end
  end
    
end
