class BlogController < ApplicationController
  include BlogHelper
  skip_before_action :verify_authenticity_token

  def index
    @blogs = loadAllBlog
    if @blogs.length !=0
    	render json: @blogs
    else
    	render json: {"Message" => "There is no Blog"}
	end
  end

  def show
	render json: singleBlog
  end

  def create
    createNewBlog
  end

  def update
	updateExistingBlog
  end

  def destroy
	deleteExistingBlog
  end
end
