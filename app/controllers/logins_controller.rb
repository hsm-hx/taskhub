class LoginsController < ApplicationController
  def show
    render "new"
  end

  def create
    user = User.find_by(user_id: params[:user_id])

    if user #and user.authenticate(params[:pass])
      session[:user_id] = user.id
      redirect_to tasks_url
    else 
      flash.now.alert = "ユーザーIDまたはパスワードが間違っています"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    @current_user = nil
    redirect_to login_path
  end
end
