class CooksController < ApplicationController
  def index
    @cooks = Cook.all
  end

  def new
    @cook = Cook.new
  end

  def create
    @cook = Cook.new(cook_params)
    if @cook.save
      redirect_to cooks_url, notice: "「#{@cook.name}」の記事を投稿しました"
    else
      render :new
    end
  end
  
  def show
    @cook = Cook.find(params[:id])
  end

  def edit
    @cook = Cook.find(params[:id])
  end

  def update
    @cook = Cook.find(params[:id])

    if @cook.update(cook_params)
      redirect_to cooks_url, notice: "「#{@cook.name}」を更新しました。"
    else
      render :edit
    end
  end
  
  def destroy
    @cook = Cook.find(params[:id])
    @cook.destroy
    redirect_to cooks_url, notice:"「#{@cook.name}」を削除しました。"
  end
  
  private
    def cook_params
      params.require(:cook).permit(:name,:how_to,:image)
    end
    
end
