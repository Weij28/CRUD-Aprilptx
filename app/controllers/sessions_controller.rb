class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # email = user_params[:email]
    # password = user_params[:password]

    user = User.login(user_params)
    if user 
      # 發號碼牌
      session[:thankyou9527] = user.id
      # 這邊屬於進階加密設定

      # 這邊的id是我設定的一個 方法，他可以轉變成email或者其他內容

      # 轉去首頁
      redirect_to root_path 
    else
      redirect_to sign_in_sessions_path
    end
    # render html: params
    # 1 查有無帳號 / 密碼
    # 2 轉址 / 重登
  end

  def destroy 
    session[:thankyou9527] = nill
    redirect_to root_path 
  end


  private 
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
