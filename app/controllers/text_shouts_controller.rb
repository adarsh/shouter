class TextShoutsController < ApplicationController
  def create
    text_shout = TextShout.new(params[:text_shout])
    shout = current_user.shouts.new(medium: text_shout)
    shout.save
    redirect_to dashboard_path, notice: "Shouted!"
  end
end
