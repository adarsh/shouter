class PhotoShoutsController < ApplicationController
  def create
    current_user.create_shout PhotoShout.new(params[:photo_shout])
    redirect_to dashboard_path, notice: "Shouted!"
  end
end
