class UsersController < ApplicationController
  before_action :authenticate_user!

  def index 
    if admin? 
      if params[:role].present?
        render json: User.where(role: "manager"), status: :ok
      else
        render json: User.all, status: :ok
      end
    else
      render status: :unauthorized
    end
  end

  def toggle_block
    if admin?
      user = User.find_by(id: params[:id], role: "manager") 
      user.update!(blocked: !user.blocked)
      
      render json: user, status: :ok
    else
      render status: :unauthorized
    end
  end

  private

  def admin?
    current_user.role == "admin"
  end
end
