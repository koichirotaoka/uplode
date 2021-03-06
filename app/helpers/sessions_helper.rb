module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    current_user.present?
  end
  
  def login_ck_plus
    unless @blog.user_id==current_user.id
      flash[:notice] = '失敗しました'
      render new_session_path
    end
  end
end
