class PostsController < ApplicationController

  before_action :set_post, only: [:update, :show, :edit, :destroy]
  def index
    #cookies.permanent.signed[:username] = {
      #value: "djodjo kabongo",
      #expires: 1.year.from_now
    #}
    #cookies.delete(:username)
  	@posts = Post.all

    puts = "====="
    puts request.format
    respond_to do |format|
      format.html
      format.json {render json: @posts}
      format.xml {render xml: @posts}
    end

  end

  def show
    respond_to do |format|
      format.html
      format.json {render json: @post}
      format.xml {render xml: @post}
    end
  end

  def edit

  end

  def update

  	if @post.update(post_params)

  	 redirect_to posts_path, success: "l'article à été modifié avec success"

    else

      render "edit"
    end

  end

  def new
  	@post = Post.new

  end

  def create
  	post = Post.new(post_params)
    
    if post.valid?
      post.save
  	  redirect_to post_path(post.id), success: "l'article à été crée avec success"
    else
      @post = post
      render "new"
    end
  end

  def destroy

  	@post.destroy

  	redirect_to posts_path, success: "l'article à été supprimé avec success"
  end

  private

  def post_params
  	params.require(:post).permit(:title, :slug, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
