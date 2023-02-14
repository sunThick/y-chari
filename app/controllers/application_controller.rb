class ApplicationController < ActionController::Base

  before_action :set_search
  before_action :set_profile

  def set_profile
    if current_user.present? 
      @profile_header = current_user.profile
    end
  end

  def set_search
    @search = Post.ransack(params[:q]) 
    @search_posts = @search.result.order(created_at: :desc)
    @items = @search.result.order(created_at: :desc)
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

  def halfway_account
    if current_user.profile.nil?
      redirect_to new_account_path(current_user)
      flash[:notice] = "プロフィールを完成させて下さい"
    end
  end

  def after_sign_in_path_for(resource)
    if current_user.profile.nil?
      new_account_path
    else
      users_show_path(current_username)
    end
  end

  def after_log_out_path_for(resource_or_scope)
    root_path 
  end

  
end
