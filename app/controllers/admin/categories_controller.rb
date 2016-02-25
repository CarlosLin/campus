class Admin::CategoriesController < AdminController
    before_action :find_admin_category, only: [:show, :edit, :update, :destroy]
  def index
    @admin_categories = Admin::Category.all
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

  private
    def find_admin_category
      @admin_category = Admin::Category.find(params[:id])
    end

    def admin_category_params
      params.require(:admin_category).permit(:category)
    end
end
