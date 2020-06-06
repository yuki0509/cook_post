class CooksController < ApplicationController
  before_action :set_cook, only: [:show, :edit, :update, :destroy]
  
  def index
    @cooks = current_user.cooks.all
  end

  def new
    @cook = current_user.cooks.new
  end

  def create
    @cook = current_user.cooks.new(cook_params)
    if @cook.save
      redirect_to cooks_url, notice: "「#{@cook.name}」の記事を投稿しました"
    else
      render :new
    end
  end
  
  def show
  end

  def edit
  end

  def update
    if @cook.update(cook_params)
      redirect_to cooks_url, notice: "「#{@cook.name}」を更新しました。"
    else
      render :edit
    end
  end
  
  def destroy
    @cook.destroy
    redirect_to cooks_url, notice:"「#{@cook.name}」を削除しました。"
  end
  
  private
    def cook_params
      params.require(:cook).permit(:name,:how_to,:image)
    end
    
    def set_cook
      @cook = current_user.cooks.find(params[:id])
    end
    
end
