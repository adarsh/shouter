class WelcomeController < ApplicationController
  before_filter :redirect_to_dashboard_if_signed_in

  private
  def redirect_to_dashboard_if_signed_in
    redirect_to dashboard_path if signed_in?
  end
end
