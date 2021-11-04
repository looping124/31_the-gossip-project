class GossipsController < ApplicationController

  before_action :authenticate_user, only: [:new]
  before_action :authenticate_user_is_author , only: [:edit,:destroy]

  def index
  end

  def new
    @gossip = Gossip.new(title:"new",content:"newnew",user:current_user)
  end

  def create
    gossip = Gossip.new(title:params[:title],content:params[:content],user:current_user)

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

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

  def authenticate_user_is_author
    unless current_user == Gossip.find(params[:id]).user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end



end
