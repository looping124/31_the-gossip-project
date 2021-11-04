class GossipsController < ApplicationController
  def index
  end

  def new
    @gossip = Gossip.new(title:"new",content:"newnew",user:User.all.first)
  end

  def create
    gossip = Gossip.new(title:params[:title],content:params[:content],user:User.all.first)

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
    puts "o" * 80
    puts @gossip
    
    @comments =  @gossip.comments.order('updated_at DESC')
    puts "o" * 80
    puts @comments
    @tags =  @gossip.tags
    puts "o" * 80
    puts @tags
  end

  def edit
    @gossip = Gossip.find(params[:id])
    @gossip.content = @gossip.content.gsub( "\"", "")
  end

  def update
    
    @gossip = Gossip.find(params[:id])
    gossip_params = params.require(:gossip).permit(:title, :content)
    
    if @gossip.update(gossip_params)
     redirect_to gossip_path(@gossip.id), success: "Gossip modifié avec succès"
    else
      render 'edit'
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to root_path
  end


end
