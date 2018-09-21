class TopController < ApplicationController
  before_action :login_ck, only: [:index]
  
  def index
  end
  
  private
  
  #ログインチェック
  def login_ck
    unless current_user
      flash[:notice] = '失敗しました'
      render new_session_path
    end
  end

end
