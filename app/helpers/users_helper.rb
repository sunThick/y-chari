module UsersHelper
  def active_nav(link_path)
    current_page?(link_path) ? "active" : ""
  end

  def username
    @user.profile.username
  end


end
