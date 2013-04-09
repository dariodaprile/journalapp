class PostsController < ApplicationController
  # GET /users/1/posts
  # GET /users/1/posts.json
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /users/1/posts/1
  # GET /users/1//posts/1.json
  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /users/1/posts/new
  # GET /users/1/posts/new.json
  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /users/1/posts/1/edit
  def edit
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  # POST /users/1/posts
  # POST /users/1/posts.json
  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to [@user, @post], notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1/posts/1
  # PUT /users/1/posts/1.json
  def update
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1/posts/1
  # DELETE /users/1/posts/1.json
  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
