class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def show
    @id=params[:id]
    @user = User.find_by(id: @id)
    @gossips_of_user = Gossip.where(user_id:@id).order('updated_at DESC')
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
