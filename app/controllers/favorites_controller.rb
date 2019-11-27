class FavoritesController < ApplicationController

    def create 

        if current_user != nil
            restaurant = Restaurant.find_by(id: params[:restaurant_id])
            if !current_user.restaurants.include?(restaurant)
                Favorite.create(user: current_user, restaurant_id: params[:restaurant_id])
                render json: {ok: "Added to favorites"}
            else
                render json: {errors: ["Restaurant already exist in your favorites"]}, status: 422
            end
            
        else
            render json: {errors: ["User invalid"]}, status: 422
        end

    end

    def show
        
        @favorites = Favorite.where(user: current_user)
        render json: @favorites

    end



    # private
    # def favorites_params
    #     params.permit[:restaurant]
    # end
end
