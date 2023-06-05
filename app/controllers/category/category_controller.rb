class Category::CategoryController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        categories = Category.all
        if categories.length != 0 then
            render json: categories, status: :ok
        else
            render json: ["Message"=>"there is no category"], status: :ok
        end
    end
    
    def create
        category = Category.new(category_params)
        if category.save
            render json: { message: "Category created successfully." }, status: :created
          else
            render json: { errors: category.errors.full_messages }, status: :bad_request
          end
        
    end


    def category_params
        params.require(:category).permit(:name, :image)
      end



end
