class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :completed_account?
  
  
  def show
    @profile = Profile.find_by(username: params[:username])
    id = @profile.user_id
    @user = User.find_by(id: id)
    likes = @user.likes
    @posts = Post.where(user_id: id).order(created_at: :desc)
    
    post_ids = likes.map {|hash| hash["post_id"]}
    @liked_posts = Post.find(post_ids)
  end

  def likes
    @profile = Profile.find_by(username: params[:username])
    id = @profile.user_id
    @user = User.find_by(id: id)
    likes = @user.likes
    @posts = Post.where(user_id: id).order(created_at: :desc)
    
    post_ids = likes.map {|hash| hash["post_id"]}
    @liked_posts = Post.where(id: post_ids).order(created_at: :desc)
  end

  private

    def completed_account?
      if current_user.profile.nil?
          redirect_to new_account_path
          flash[:notice] = 'プロフィールを完成させて下さい'
      end
    end

end
