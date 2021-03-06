class CommentsController < ApplicationController
  
  def create 
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comments = @post.comments.find(params[:id])
    @comments.destroy
    redirect_to post_path(@post)
  end

  private 
    def comment_params
      params.require(:comment).permit(:body)
    end
end
