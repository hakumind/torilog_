class PostsController < ApplicationController
  def select
  end

  def post
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id= @current_user.id
  
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to("/posts/memory")
    else
      flash[:notice] = "投稿に失敗しました"
      render("posts/post")
    end
  end

  def memory
    # @posts =Post.all：全ユーザーの投稿
    # @posts = Post.find_by(user_id: @current_user.id)：条件に該当するものを一つだけしか取り出せない
    @posts = Post.where(user_id: @current_user.id)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/memory")
  end

  private
  def post_params
    params.require(:post).permit(:name,:image)
  end
end