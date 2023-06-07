class Category::CategoryController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        categories = Category.order(created_at: :desc)
        if categories.length != 0 then
            render json: categories, status: :ok
        else
            render json: ["Message"=>"there is no category"], status: :ok
        end
    end
    
    def create
        category = Category.new(category_params)
        category.slug = category_params[:name].parameterize
        if category.save
            render json: { message: "Category created successfully." }, status: :created
        else
            render json: { errors: category.errors.full_messages }, status: :bad_request
        end
        
    end

    def show
        # params.inspect
        # @category = Category.find(params[:id])

        # render json: @category, status: :ok
        render json: params

    end
    

    def update
        @category = Category.find(params[:id])
        @category.slug = category_params[:name].parameterize
        if @category.update(category_params)
            render json: { message: "Category updated successfully." }, status: :created
        else
            render json: { errors: category.errors.full_messages }, status: :bad_request
        end
    end


    def destroy
        @category = Category.find(params[:id])
        if @category.destroy
            render json: { message: "Category Deleted successfully." }, status: :created
        else
            render json: { errors: category.errors.full_messages }, status: :bad_request
        end
    end
    
    


    def category_params
        params.require(:category).permit(:name, :image)
    end



end
