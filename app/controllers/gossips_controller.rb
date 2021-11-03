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
      redirect_to gossip_path(gossip.id), success: "Gossip créé avec succès"
    else
      @gossip = gossip
      render 'new'
    end


  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def edit
    @gossip = Gossip.find(params[:id])
    @gossip.content = @gossip.content.gsub( "\"", "")
  end

  def update
    puts "%"*80
    @gossip = Gossip.find(params[:id])
    gossip_params = params.require(:gossip).permit(:title, :content)
    
    if @gossip.update(gossip_params)
     redirect_to gossip_path(@gossip.id), success: "Gossip modifié avec succès"
    else
      render 'edit'
    end
  end

  def destroy
  end
end
