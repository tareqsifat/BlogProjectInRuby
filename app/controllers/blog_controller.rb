class BlogController < ApplicationController
  include BlogHelper
  skip_before_action :verify_authenticity_token

  def index
    @blogs = loadAllBlog
    if @blogs.length != 0 then
      render json: categories, status: :ok
  else
      render json: ["Message"=>"there is no blog"], status: :ok
  end
  end

  def show
  end

  def create
    createNewBlog
  end

  def update
  end

  def destroy
  end
end
