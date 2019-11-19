class UsersController < ApplicationController

    def profile
        # 1- extracts token from request.headers["Authorization"]
        # 2- Decode token and extracts basic valuable information lie user_id
        # 3- Send it back to the front end as json:

        # token = request.headers['Authorization'].split(' ')[1]  ##Split Bearer from the actual token
        # decode_token = JWT.decode(token, 'SecretKey', true, {algorithm: 'HS256'})
        # user_id = decode_token[0]['user_id']
        # current_user = User.find(user_id)

        #code above got subtitute by helper methods

        render json: current_user
    end

    def create 
        user = User.create(user_params)
        if user.valid?
            render json: {token: create_token(user.id)}
        else
           render json: {errors: user.errors.full_messages}, status: 422
        end
        
    end

    private 

    def user_params
       
        params.permit(:username, :email, :password, :password_confirmation)
    end



end
