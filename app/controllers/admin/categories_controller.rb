class Admin::CategoriesController < AdminController
    before_action :find_admin_category, only: [:show, :edit, :update, :destroy]
  def index
    @admin_categories = Admin::Category.roots
    @admin_subcategories = Category.sub_categories
    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
  end

  def new
    @admin_category = Admin::Category.new
  end

  def create
    @admin_category = Admin::Category.new(admin_category_params)
    if @admin_category.save
      redirect_to @admin_category
      flash[:notice] = 'Category was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
      if @admin_category.update(admin_category_params)
        redirect_to @admin_category
        flash[:notice] = 'Category was successfully updated.'
      else
        render :edit
    end
  end

  def destroy
    @admin_category.destroy
      redirect_to category_path 
  end

  def sub_cate  
   options = ""  
   @category = Category.where "parent_id =?", (params[:id])
   @category.each do |c|  
     options << "<option value=#{c.id}>#{c.category_name}</option>"  
   end
   # else
   #  @category = Category.where "parent_id =?", '7'
   #  @category.each do |c|  
   #    p c
   #  end
   # end  
   render :text => options  
 end

  private
    def find_admin_category
      @admin_category = Admin::Category.find(params[:id])
    end

    def admin_category_params
      params.require(:admin_category).permit(:category_name, :parent_id)
    end
end
