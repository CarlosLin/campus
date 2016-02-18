class AuctionsController < ApplicationController
  layout "auction"
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    # @auctions = Auction.order(:id)
    @auctions = Auction.order(:id).includes(:user).includes(:photos)
  end
  def show
  end
  def new
    @auction = Auction.new
  end
  def create
    @auction = current_user.auctions.build(auction_params)
    if @auction.save
      if params[:images]
        params[:images].each {
          |image| @auction.photos.create(image: image)
        }
      end
      redirect_to @auction
    else
      render new
    end
  end
  def edit
  end
  def update
    if @auction.update(auction_params)
      redirect_to @auction
    else
      render 'edit'
    end
  end
  def destroy
    @auction.destroy
    redirect_to auctions_path
  end

  private
    def find_item
      @auction = current_user.auctions.find(params[:id])
    end
    def auction_params
      params.require(:auction).permit(:item_name, :narrative, :quantity, :price, :photos)
    end
end
