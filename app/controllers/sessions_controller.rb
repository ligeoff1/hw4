class SessionsController < ApplicationController
  def new
  end

  def create
      @user = User.where({email: params["email"]})[0]
      if @user
        if @user.password == params["password"]
           flash[:notice] = "Welcome!"
           redirect_to "/places"
        else     
          flash[:notice] = "Incorrect Email or Password"
          redirect_to "/sessions/new"
        end
      else
        flash[:notice] = "Incorrect Email or Password"
        redirect_to "/sessions/new"
      end
  end

  def destroy
  end
end
  