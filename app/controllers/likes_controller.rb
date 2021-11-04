class LikesController < ApplicationController
  def index
  end

  def new
    @gossip = Gossip.find(params[:gossip_id])
    @like = Like.create(likeable: @gossip, user:current_user)
    redirect_to gossip_path(params[:gossip_id])
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to gossip_path(params[:gossip_id])
  end

end
