class SessionsController < ApplicationController
  skip_before_action :login_required, :set_search_query

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])

    if @user&.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_url, notice:'ログインしました。'
    else
      flash[:notice] = "再ログインしてね"
      render :new
    end
  end
  
  def destroy
    reset_session
    redirect_to root_url, notice: 'ログアウトしました。'
  end
end
