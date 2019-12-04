class VotesController < ApplicationController


    def create 
        
        if current_user_login == nil
            render json: {errors: ["You have to be logged in order to submit a vote"]}, status: 422
        else
            @vote = Vote.create(user: current_user_login, stars: params[:stars].to_i, comment: params[:comment], dish_id: params[:dish])
            if @vote.valid?
                render json: @vote
            else
                render json: {errors: @vote.errors.messages}, status: 422
            end
        end

    end



end
