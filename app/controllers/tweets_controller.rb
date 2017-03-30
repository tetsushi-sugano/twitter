class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy]
  
  def index
    @tweets = Tweet.all
  end
  
  def new
    if params[:back]
      @tweet = Tweet.new(tweets_params)
    else
      @tweet = Tweet.new
    end
  end

  def create
    @tweet = Tweet.new(tweets_params)
    if @tweet.save
      # 一覧へ遷移。noticeのメッセージ表示
      redirect_to tweets_path, notice: "つぶやきました！"
    else
      # 入力フォームを再描画
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    @tweet.update(tweets_params)
    if @tweet.save
      # 一覧へ遷移。noticeのメッセージ表示
      redirect_to tweets_path, notice: "つぶやきました！"
    else
      # 編集フォームを再描画
      render 'edit'
    end
  end
  
  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: "削除しました！"
  end
  
  def confirm
    @tweet = Tweet.new(tweets_params)
    render :new if @tweet.invalid?
  end
  
  private
    def tweets_params
      params.require(:tweet).permit(:content)
    end
    
    # idをキーとして値を取得するメソッド
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end
    
end