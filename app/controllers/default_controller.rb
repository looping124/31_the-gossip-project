class DefaultController < ApplicationController

  def home
    @gossips = Gossip.all
  end

  def gossip
    @id=params[:id]
  
    @gossip = Gossip.find_by(id: @id)
  end
  
  def user
    @id=params[:id]
    @user = User.find_by(id: @id)
    @gossips_of_user = Gossip.where(user_id:@id)
  end

  def welcome
    @name = params[:name]
    puts "_"*80
    puts params[:name]
    puts "_"*80
  end

  def team
    @name = params[:name]
    puts "_"*80
    puts params[:name]
    puts "_"*80
  end

  def contact
  end

end
