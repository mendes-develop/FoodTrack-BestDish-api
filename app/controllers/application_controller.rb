class ApplicationController < ActionController::API

    def token
        request.headers['Authorization'].split(' ')[1]
    end

    def secretKey 
        jwt_secret = proccess.env['JWT_SECRET']
        puts jwt_secret
    end

    def decoded_token
        
        JWT.decode(token, secretKey, true, {algorithm: 'HS256'})
    end

    def current_user_login
        
        if request.headers['Authorization'].split(' ')[1] == "undefined"
            return nil
        else
            User.find(decoded_token()[0]['user_id'])
        end
    end

    def create_token(user_id)

        
        payload = {user_id: user_id}
        JWT.encode(payload, secretKey, 'HS256')
        
        
    end



end
