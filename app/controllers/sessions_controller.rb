class SessionsController < ApplicationController

  def index
  end

  def new

  end

  def create
    # cherche s'il existe un utilisateur en base avec l’e-mail
    session_params = params.require(:sessions).permit(:email,:password)

    user = User.find_by(email: session_params[:email])

    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      # redirige où tu veux, avec un flash ou pas
      redirect_to root_path

    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    session.delete(:user_id)
  end
end
