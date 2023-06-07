class BlogController < ApplicationController
  include BlogHelper
  skip_before_action :verify_authenticity_token

  def index
    @blogs = loadAllBlog
    # @blogs = Blog.includes([:category, :user, :sub_category]).order(created_at: :desc)
    # render json: @blog
    # if @blogs.length != 0 then
    #   render json: @blogs, status: :ok
    # else
    #     render json: ["Message"=>"there is no blog"], status: :ok
    # end
    render json: @blogs

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
