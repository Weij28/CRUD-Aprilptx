class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # email = user_params[:email]
    # password = user_params[:password]

    if User.login(user_params)
      # 發號碼牌
    else
      redirect_to sign_in_sessions_path
    end

    render html: params
    # 1 查有無帳號 / 密碼
    # 2 轉址 / 重登
  end

  private 
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
