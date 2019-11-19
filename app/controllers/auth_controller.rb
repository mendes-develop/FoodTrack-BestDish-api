class AuthController < ApplicationController

    def login
        # 1- Find user based on username and/or email
        # 2- check if user exist and password matches
        # 3- if t's true generate a JWT token else render errors

        # 3.a create payload, encode it with JWT.econde + SecretKey + HMAC Alghorithm
        # 3.b render token to the user render {token: token}

        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            # payload = {user_id: user.id}
            # token = JWT.encode(payload, 'SecretKey', 'HS256')
            render json: {token: create_token(user.id)} 
        else
            render json: {errors: ["Username or password don't match. Please, try it again."]}, status: 422
        end
       
    end

    

    # def is_authenticated(params)
    #     user = User.find_by(username: params[:username])
    #     if user !nil 
    #         return user.authenticate(params[:password])
    #     end
    #     return false
    # end 

end
