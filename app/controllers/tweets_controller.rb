class TweetsController < ApplicationController
  before_action :authenticate_user!
  def index
    @tweets = Tweet.all.order('created_at DESC')
    @nickname = current_user.profile.nickname
  end

  def new
    @tweet = Tweet.new    
  end

  def create
    # render plain: params[:post].inspect
    # save
    @tweet = Tweet.new(params.require(:post).permit(:tweet))
    @tweet.user = current_user

    # respond_to do |format|
      if @tweet.save
        redirect_to tweets_path
        # format.html { redirect_to tweets_path, notice: 'Photo was successfully created.' }
        # format.json { render :index, status: :created, location: @tweet }
      else
        render plain: @tweet.errors.inspect
        # format.html { render :new }
        # format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    # end
=begin    
    if @tweet.save
        # redirect
        redirect_to 'root'
    else  
      # redirect_to 'root'
      
      # render 'root'
    end
=end        
  end  

  def destroy
  end
end
