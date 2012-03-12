class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @shouts = @user.shouts.current.includes(:medium => :shout)
  end
end
