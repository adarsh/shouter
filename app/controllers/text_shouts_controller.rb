class TextShoutsController < ApplicationController
  def create
    current_user.create_shout TextShout.new(params[:text_shout])
    redirect_to dashboard_path, notice: "Shouted!"
  end
end
