class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:create, :update, :edit] 
  before_action :account_exist? , only: [:new, :create]
  before_action :halfway_account, except: [:new, :create]

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(profile_params)
    @profile.portrailt.attach(params[:portrailt])
    if @profile.save
        flash[:notice] = 'プロフィールを作成しました。chariを投稿してみましょう'
        redirect_to users_show_path(current_username)
    else
        render :new, status: :unprocessable_entity
    end
  end




  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
        if @profile.update(profile_params)
          # @profile.portrailt.attach(params[:image])
                redirect_to users_show_path(current_username)
                flash[:notice] = "Profile was successfully updated."
        else
                render :edit, status: :unprocessable_entity
        end
  end



   # 画像アップロード用のアクション,選択状態の画像をパラメータにマージ（profileモデルとの紐付け）
  def upload_image
    @profile = current_user.profile
    create_blob(params[:image])
    @profile.portrailt.attach(params[:image])
    flash[:notice] = '写真を変更しました'
  end

  def delete_image
    @profile = current_user.profile
    if @profile.portrailt.purge
      flash[:notice] = 'delete photo'
    end
  end

  private
    
    def profile_params
        params.require(:profile).permit(:name, :username, :avatar, :description)
    end

    # blobデータの作成
    def create_blob(file)
      ActiveStorage::Blob.create_and_upload!(
        io: file.open,
        filename: file.original_filename,
        content_type: file.content_type
      )
    end

    def account_exist?
        if !current_user.profile.nil?
            redirect_to users_show_path(current_username)
            flash[:notice] = '既にプロフィールは登録済みです'
        else

        end
    end

    def correct_user
      @profile = current_user.profile
      redirect_to root_path unless @profile == current_user.profile
    end

end
