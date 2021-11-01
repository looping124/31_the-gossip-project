class DefaultController < ApplicationController

  def home
    @gossips = Gossip.all
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
