class AuctionsController < ApplicationController
  layout "auction"
  before_action :find_auction, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  respond_to :js, :html
  def index
    # @auctions = Auction.order(:id)
    @auctions = Auction.order(:id).includes(:user,:photos)
    @cate_roots = Category.roots
    @sub_categories = Category.sub_categories
  end
  def show
  end
  def new
    @auction = Auction.new
    @cate_roots = Category.roots
    @sub_categories = Category.sub_categories
    # @sub_categories = Category.where(parent_id: params[:parent_id]).pluck(:category_name, :id)
    p "-----cate-----"
    p @cate_roots
    p "-----sub_categories----"
    p @sub_categories
    respond_to :json, :html
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
    if @auction.update_attributes(auction_params)
      if params[:images]
        params[:images].each {
          |image| @auction.photos.create(image: image)
        }
      end
      redirect_to @auction
    else
      render 'edit'
    end
  end
  def destroy 
    @auction.destroy
    redirect_to auctions_path
  end

  def sub_cate  
   options = ""  
   @category = Category.find_by_parent_id(params[:id])
   @category.each do |c|  
     options << "<option value=#{c.id}>#{c.category_name}</option>"  
   end  
   render :text => options  
 end  
 

  private
    def find_auction
      @auction = current_user.auctions.find_by(id: params[:id])
    end
    def auction_params
      # params["auction"]["groups"] = params["auction"]["groups"].split(",")
      params.require(:auction).permit(:item_name, :narrative, :quantity, :price, :photos  )
    end
end
