class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:edit, :update, :destroy]

  before_action :check_user!, except: [:index, :show]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @comment = @restaurant.comments.new
    @comments = @restaurant.comments.order(id: :desc)  
    # 第三行指的是把comment本身的內容依照一個順序把他回傳回來，並把最新內容放在最上面
    
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    # @restaurant = Restaurant.new(restaurant_params)
    # @restaurant.user_id = current_user.id
    @restaurant = current_user.restaurants.new(restaurant_params)

    if @restaurant.save
      redirect_to restaurants_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private
    def find_restaurant
      # @restaurant = Restaurant.find(params[:id])
      # 1
      # @restaurant = Restaurant.find_by!(
      #   id: params[:id],
      #   user_id: current_user.id
      # )

      # 2
      @restaurant = current_user.restaurants.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:title, :tel, :address, :email, :description)
    end

end
