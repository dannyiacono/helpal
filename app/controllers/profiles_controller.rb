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
    if @user.update(set_user_params)
      @user_category_ids = params[:user][:category_ids]
      @user.user_categories.destroy_all
      @user_category_ids.each do |user_category_id|
        @user.user_categories.create(category_id: user_category_id)
      end
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
