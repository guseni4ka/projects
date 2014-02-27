class WelcomeController < ApplicationController
  def index
  	# @temp = params[:var] ? params[:var] : ''
  end

  def form_action
  	@name = params[:name] ? params[:name] : ''
  end
end
