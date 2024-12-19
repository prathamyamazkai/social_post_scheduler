class SessionsController < ApplicationController
    def create
      auth = request.env['omniauth.auth']
      user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.token = auth['credentials']['token']
      end
      session[:user_id] = user.id
      redirect_to root_path, notice: "Signed in successfully!"
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to root_path, notice: "Signed out!"
    end
end
  