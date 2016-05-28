class UserProfileController < ApplicationController
  def show
    @user = User.find_by_slug(params[:slug])
    if @user.present?

    else
      redirect_to "/"
    end
  end
end