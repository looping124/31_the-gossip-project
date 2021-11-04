class CommentsController < ApplicationController

  before_action :authenticate_user_is_author , only: [:edit,:destroy]

  
  def index
  end

  def new
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new(content:"",user:current_user,commentable:@gossip)
  end

  def create
    
    comment_params = params.require(:comment).permit(:content)
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new(content:comment_params[:content], user:current_user, commentable:@gossip)

    if @comment.valid?
      @comment.save
      redirect_to gossip_path(params[:gossip_id]), success: "Commentaire ajouté avec succès"
     else
       render 'new'
     end
  end

  def show
  end

  def edit
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
  end

  def update
    comment_params = params.require(:comment).permit(:content)
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    comment_test = Comment.new(content:comment_params[:content], user:current_user, commentable:@gossip)
    if comment_test.valid?
      @comment.update(content:comment_params[:content], user:current_user, commentable:@gossip)
      redirect_to gossip_path(params[:gossip_id]), success: "Commentaire modifié avec succès"
     else
       render 'edit'
     end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to gossip_path(params[:gossip_id])
  end
private

def authenticate_user_is_author
  unless current_user == Comment.find(params[:id]).user
    flash[:danger] = "Please log in."
    redirect_to new_session_path
  end
end
end
