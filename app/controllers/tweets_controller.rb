class TweetsController < ApplicationController
  before_action :authenticate_user!
  def index
    @tweets = Tweet.all
  end

  def new
    
  end

  def destroy
  end
end
