class FavoritesController < ApplicationController

    def create 
        
        if current_user_login == nil
            render json: {errors: ["Log in or create an account to save it to your favorites"]}, status: 422
        else
           restaurant = Restaurant.find_by(id: params[:restaurant_id])
            if !current_user_login.restaurants.include?(restaurant)
                @favorite = Favorite.create(user: current_user_login, restaurant_id: params[:restaurant_id])
                render json: @favorite, include: "**"
            else
                render json: {errors: ["Restaurant already exist in your favorites"]}, status: 422
            end
        end

    end

    def show
        
        @favorites = Favorite.where(user: current_user_login)
        render json: @favorites, include: "**"

    end

    def destroy         
        if current_user_login
            @favorite = Favorite.find_by(user: current_user_login, restaurant_id: params[:id])

            if @favorite 
                @favorite.destroy
                render json:  @favorite, include: "**"
            else
                render json: {errors: ["Problem tring to remove from favorites. Please, try it again"]}, status: 422
            end


        end
    end



    # private
    # def favorites_params
    #     params.permit[:restaurant]
    # end
end
