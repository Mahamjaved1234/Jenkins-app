class UsersController < ApplicationController
  def index  
  end
 
    def create 
       
        client_params = user_params
        client_params['ip'] = request.remote_ip
        user=User.new(client_params)
        render json: user
        puts "#{params}"
        # if user.save 
        #     session[:user_id]= user.id
        #     session[:user_name]= user.name
        #     redirect_to '/posts'
        # else 
        #     flash[:register_errors] = user.errors.full_messages
        #     redirect_to '/'
        # end
    end
    private 
    def user_params
      
       params.require(:user).permit(:name, :email , :password, :password_confirmation)
    end     
end
