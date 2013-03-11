class ClosetItemsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @closet_items = @user.closet_items
  end
end
