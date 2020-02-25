require 'pry'

class PostsController < ApplicationController
	#before_action :post_params, only: [:update, :create]

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new(post_params)
	#   @post.title = post_params(:title)[:title]
	#   @post.description = post_params(:description)[:description]
	  @post.save
	  redirect_to post_path(@post)
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
	  @post = Post.find(params[:id])
	  @post.update(post_params)
	  redirect_to post_path(@post)
	end

	private

	def post_params
		params.require(:post).permit(:title, :description)
	end


end