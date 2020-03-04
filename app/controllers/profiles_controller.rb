class ProfilesController < ApplicationController
  def my_profile
    @user = current_user
  end

  def other_profile
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user_categories = UserCategory.new()
    if @user.update(set_user_params)
      raise
      redirect_to my_profile_path(@user)
    else
      render :edit
    end
  end

  private

  def set_user_params
    params.require(:user).permit(:first_name, :last_name, :location, :age, :bio)
  end
end
