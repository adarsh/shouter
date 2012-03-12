class ShoutsController < ApplicationController
  def show
    @shout = Shout.find(params[:id])
  end

  def create
    shout = current_user.shouts.new(params[:shout])
    shout.save
    redirect_to dashboard_path, notice: "Shouted!"
  end
end
