class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update]
	def index
		@posts = Post.all
	end

	def show
	end

	def new
		@post = Post.new
	end

	def create
	  # @post = Post.new(post_params(:title, :description))
	  #not sure why the above line of code won't work?
      @post = Post.new
	  @post.title = params[:title]
	  @post.description = params[:description]
	  @post.save
	  redirect_to post_path(@post)
	end

	def edit
	end

	def update
	  @post.update(post_params(:title, :description))
	  redirect_to post_path(@post)
	end

	private

	def find_post
	  @post = Post.find(params[:id])
	end

	def post_params(*args)
	  params.require(:post).permit(*args)
	end
end