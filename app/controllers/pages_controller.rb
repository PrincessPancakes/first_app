class PagesController < ApplicationController
  layout 'with_top_bar'
  def index
    @beta_request = BetaRequest.new
    render layout: 'application'
  end

  def onboarding

  end

  def login

  end

  def profile

  end

  def adjustment

  end

  def url

  end

  def comparison_v1

  end

  def comparison_v2

  end

  def comparison_v3

  end

  def search

  end


end
