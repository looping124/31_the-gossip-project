module SessionsHelper

  # def current_user
  #   User.find_by(id: session[:user_id])
  # end


  def current_user
    if session[:user_id]
      current_user = User.find_by(id: session[:user_id])
    elsif cookies[:user_id]
      user = User.find_by(id: cookies[:user_id])
      puts 's' * 60
      puts user
      puts user.remember_digest.inspect
      puts cookies[:remember_token].inspect
      puts 's' * 60
      if user && BCrypt::Password.new(user.remember_digest).is_password?(cookies[:remember_token])
        log_in(user)
        current_user = user
      end
    end
  end


  def log_in(user)
    session[:user_id] = user.id
  end

  
  def remember(user)
    # ici je vais créer un remember_token qui est une suite aléatoire de caractères
    remember_token = SecureRandom.urlsafe_base64
  
    # j'ai mon token, je vais stocker son digest en base de données :    
    user.remember(remember_token)
    puts "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
    puts user.remember_digest
  
    #  maintenant, je vais créer les cookies : un cookie qui va conserver l'user_id, et un autre qui va enregistrer le remember_token
    cookies.permanent[:user_id] = user.id
    cookies.permanent[:remember_token] = remember_token
  
  end

end
