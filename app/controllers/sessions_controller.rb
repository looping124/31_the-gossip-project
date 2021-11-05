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
      
      log_in(user)
      remember(user)
      puts "opopopopopopopopopopopopopopoopop"
      puts user.remember_digest
      # redirige où tu veux, avec un flash ou pas
      redirect_to user_path(user.id)

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
    
      # on remet le remember_digest à nil puisqu'il ne nous servira plus :
  # user.update(remember_digest: nil)
  user = current_user
  user.remember_digest = nil
  user.save(:validate => false)
  session.delete(:user_id)
  # on efface les cookies dans le navigateur de l'utilisateur
  cookies.delete(:user_id)
  cookies.delete(:remember_token)
  end
end
