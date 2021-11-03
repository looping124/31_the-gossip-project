class GossipsController < ApplicationController
  def index
  end

  def new
    @gossip = Gossip.new(title:"new",content:"new".inspect,user:User.all.first)
  end

  def create
    gossip = Gossip.new(title:params[:title],content:params[:content].inspect,user:User.all.first)

    if gossip.content == ""
      gossip.content = nil
      render 'new'
    elsif gossip.valid?
      gossip.save
      redirect_to potin_path(gossip.id), success: "Gossip créé avec succès"
    else
      @gossip = gossip
      render 'new'
    end


  end

  def show
    @id=params[:id]
  
    @gossip = Gossip.find_by(id: @id)
  end

  def edit
    
  end

  def update
  end

  def destroy
  end
end
