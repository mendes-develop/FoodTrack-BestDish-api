class RestaurantsController < ApplicationController
    # skip_before_action :current_user
    
    def index
        restaurants = Restaurant.all
        render json: restaurants, include: "**"
    end

end
