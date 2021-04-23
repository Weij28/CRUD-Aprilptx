class CommentsController < ApplicationController
  before_action :check_user!

  def create!
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = @restaurants.comments.new(comments_params)
    @comment.user = current_user

    if @comment.save 
      redirect_to @restaurant_path(@restaurant)
    else 
      render 'restaurant/show'
      #..
    end 

    remder html: params


    def destroy 

    end 

    private 
    def comments_params
      params.require(:comment).permit(:comment)
                              .merge({user: current_user})
  
end