class CommentsController < ApplicationController
  filter_resource_access
  def create
    @post = Post.find(params[:post_id])
    comment = params[:comment]
    comment[:user_id] = current_user
    @comment = @post.comments.create(comment)
    redirect_to post_path(@post)
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
  
  def destroy
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      @comment.destroy
      redirect_to post_path(@post)
  end
  
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment.post, :notice => 'comment updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end
  
end