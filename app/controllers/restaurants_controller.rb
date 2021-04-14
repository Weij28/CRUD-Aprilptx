class RestaurantsController < ApplicationController

    # rescue_from ActiveRecord::RecordNotFound, with: :not_found
  
      def index
        @restaurants = Restaurant.all
      end 
  
      def menu
      @menu = Menu.new 
      end
  
      def show 
        @restaurant = Restaurant.find_by(params[:id]) 
        # rescue 
        #   redirect_to restaurant_path 
        # end
      end 
  
      def new
      @restaurant = Restaurant.new 
      end
  
  
      def create 
  #     # render html: params[:restaurant] [:title]
      @restaurant = Restaurant.new(require_params)
    
      if @restaurant.save 
        redirect_to restaurants_path
      else 
        render :new 
      end 
    end 
  
  
    def edit 
      @restaurant = Restaurant.find(params[:id])
    end 
  
  
    def update
      @restaurant = Restaurant.find(params[:id])
  
      if @restaurant.update(restaurant_params)
        redirect_to restaurant_path(@restaurant)
      else
        render :edit 
      end
    end
  
  
    def destroy
      @restaurant = Restaurant.find(params[:id])
      @restaurant.destroy
      redirect_to restaurants_path

      
    end
  
  
    private 
    def restaurant_paramas
      params.require(:restaurant).permit(:title, :tel, :address, :email, :description)
    end
  end
  
