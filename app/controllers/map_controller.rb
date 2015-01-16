class MapController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

end
