class BetaRequestsController < ApplicationController

  def create
    @beta_request = BetaRequest.new(params[:beta_request])
    if @beta_request.save
      redirect_to root_path, success: true
    else
      flash[:error] = "Please enter a valid email."
      render 'pages/index'
    end
  end
end
