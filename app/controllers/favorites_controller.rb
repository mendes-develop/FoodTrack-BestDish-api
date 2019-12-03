class FavoritesController < ApplicationController

    def create 
        
        if current_user_login == nil
            render json: {errors: ["Log in or create an account to save it to your favorites"]}, status: 422
        else
           restaurant = Restaurant.find_by(id: params[:restaurant_id])
            if !current_user_login.restaurants.include?(restaurant)
                Favorite.create(user: current_user_login, restaurant_id: params[:restaurant_id])
                render json: {ok: "Added to favorites"}
            else
                render json: {errors: ["Restaurant already exist in your favorites"]}, status: 422
            end
        end

    end

    def show
        
        @favorites = Favorite.where(user: current_user_login)
        render json: @favorites

    end



    # private
    # def favorites_params
    #     params.permit[:restaurant]
    # end
end
