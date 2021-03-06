class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_url, notice: "「#{@user.name}」を登録しました。"
    else
      render :new
    end
  end
  
  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_url, notice: "「#{@user.name}」を更新しました。"
    else
      render :edit
    end
  end
  
  def destroy
    @user.destroy
    redirect_to admin_users_url, notice:"「#{@user.name}」を削除しました。"
  end
  
  private
    def user_params
      params.require(:user).permit(:name,:email,:admin,:image,:password,:password_confirmation)
    end
    
    def set_user
      @user = User.find(params[:id])
    end
end
