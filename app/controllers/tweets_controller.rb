class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = Tweet.all.order('created_at DESC')
    @user = current_user
    # @profile = current_user.profile
  end

  def new
    @tweet = Tweet.new    
  end

  def create
    # render plain: params[:post].inspect
    # save
    @tweet = Tweet.new(post_params)
    @tweet.user = current_user

    respond_to do |format|
        if @tweet.save
        format.html { redirect_to tweets_path, notice: 'Tweeted.' }
        format.json { render :show, status: :created, location: @tweet }
        else
        format.html { redirect_to tweets_path, notice: 'Tweet error' }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
        end
    end
  end  

  def destroy
  end

  private
    def post_params
        params.require(:post).permit(:tweet)
    end
end
