class CommentsController < ApplicationController
  def index
  end

  def new
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new(content:"",user:User.all.first,commentable:@gossip)
  end

  def create
    
    comment_params = params.require(:comment).permit(:content)
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new(content:comment_params[:content], user:@gossip.user, commentable:@gossip)

    if @comment.update(comment_params)
      puts "REUSIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII"
      redirect_to gossip_path(params[:gossip_id]), success: "Commentaire ajouté avec succès"
     else
       render 'new'
     end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
