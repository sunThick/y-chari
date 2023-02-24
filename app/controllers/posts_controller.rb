class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:update, :destroy, :edit] 
  before_action :set_post, only: [:show, :edit, :update, :destroy, :need_images]
  before_action :halfway_account, except: [:index, :show]
  before_action :set_components, only: [:new, :edit ,:create, :update]

  def index
    if params[:category]
      @posts = Post.where(category: params[:category]).order(created_at: :desc)
    else
      @posts = Post.all.order(created_at: :desc) 
    end
  end

  def show 
    id = @post.user_id
    @user = User.find(id)
    @post = Post.find(params[:id])
    @profile_post = @user.profile
  end

  def new
    @post = current_user.posts.build
    @post.build_part
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = '新規chariを投稿しました'
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    
  end

  def update
      if @post.update(post_params)
        redirect_to @post
        flash[:notice] = '編集が完了しました'
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @post.destroy
    flash[:notice] = "削除しました"
    redirect_to root_path
  end

  def upload_image
    @image_blob = create_blob(params[:image])
    render json: @image_blob
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def set_components
      ary =  Part.attribute_names
      n = ary.index("created_at")
      components = ary[1..n-1].each_slice(2).to_a
      @components_1 = components.slice(0,3)
      @components_2 = components.slice(3..5)
      @components_3 = components.slice(9..11)
      @components_4 = components.slice(12..19)
      @components_5 = components.slice(20..26)
      @components_6 = components.slice(27..30)
      @components_7 = components.slice(31..37)
      names = ['fork','head set','column spacer','handle bar','stem','stemcap','grip','bar tape','bar end','saddle','seatpost','seatclamp','tire','tube','wheel','hub','cog','lockring','free wheel','quick release','crank','chainring','chain','bottom brancket','pedals','toecrip','toestrap','brake','brake lever','brake cable','shifter','rack','bottle','light','lock','bell','helmet','bag']
      @names_1 = names.slice(0,3)
      @names_2 = names.slice(3..5)
      @names_3 = names.slice(9..11)
      @names_4 = names.slice(12..19)
      @names_5 = names.slice(20..26)
      @names_6 = names.slice(27..30)
      @names_7 = names.slice(31..37)
    end

    # def need_images
    #   if !@post.images.attached?
    #     render :edit
    #     flash.now[:notice] = "kkk"
    #   end
    # end

    def post_params
        params.require(:post).permit(:brand, :frame, :comment, :category, part_attributes: [:id, :fork_brand, :fork_name, :headset_brand, :headset_name, :columnspacer_brand, :columnspacer_name, :handlebar_brand, :handlebar_name, :stem_brand, :stem_name, :stemcap_brand, :stemcap_name, :grip_brand, :grip_name, :bartape_brand, :bartape_name, :barend_brand, :barend_name, :saddle_brand, :saddle_name, :seatpost_brand, :seatpost_name, :seatclamp_brand, :seatclamp_name, :tire_brand, :tire_name, :tube_brand, :tube_name, :wheel_brand, :wheel_name, :hub_brand, :hub_name, :cog_brand, :cog_name, :lockring_brand, :lockring_name, :freewheel_brand, :freewheel_name, :quickrelease_brand, :quickrelease_name, :crank_brand, :crank_name, :chainring_brand, :chainring_name, :chain_brand, :chain_name, :bottombrancket_brand, :bottombrancket_name, :pedals_brand, :pedals_name, :toecrip_brand, :toecrip_name, :toestrap_brand, :toestrap_name, :brake_brand, :brake_name, :brakelever_brand, :brakelever_name, :brakecable_brand, :brakecable_name, :shihter_brand, :shihter_name, :rack_brand, :rack_name, :bottle_brand, :bottle_name, :light_brand, :light_name, :lock_brand, :lock_name, :bell_brand, :bell_name, :helmet_brand, :helmet_name, :bag_brand, :bag_name])
        .merge(images: uploaded_images)
    end

    def correct_user
      post = Post.find(params[:id])
      if post.user_id != current_user.id 
        redirect_to root_path 
        flash[:alert] = '権限がありません'
      end
    end



    # アップロード済み画像の検索
    def uploaded_images
      params[:post][:images].drop(1).map{|id| ActiveStorage::Blob.find(id)} if params[:post][:images]
    end

    # blobデータの作成
    def create_blob(file)
      ActiveStorage::Blob.create_and_upload!(
        io: file.open,
        filename: file.original_filename,
        content_type: file.content_type
      )
    end

end
