module SubCategoryHelper
    def SubCategoryIndex
        subcategories = SubCategory.order(created_at: :desc)
        if subcategories.length != 0 then
            render json: subcategories, status: :ok
        else
            render json: ["Message"=>"there is no category"], status: :ok
        end
    end
    
    def SubCategorycreate
        sub_category = SubCategory.new(sub_category_params)
        sub_category.slug = sub_category_params[:name].parameterize
        if sub_category.save
            render json: { message: "sub_category created successfully." }, status: :created
        else
            render json: { errors: sub_category.errors.full_messages }, status: :bad_request
        end
        
    end

    def SubCategoryshow
        @sub_category = SubCategory.find(params[:id])

        render json: @sub_category, status: :ok

    end
    

    def SubCategoryupdate
        @sub_category = SubCategory.find(params[:id])
        @sub_category.slug = sub_category_params[:name].parameterize
        if @sub_category.update(sub_category_params)
            render json: { message: "sub_category updated successfully." }, status: :created
        else
            render json: { errors: sub_category.errors.full_messages }, status: :bad_request
        end
    end


    def SubCategorydestroy
        @sub_category = SubCategory.find(params[:id])
        if @sub_category.destroy
            render json: { message: "sub_category Deleted successfully." }, status: :created
        else
            render json: { errors: sub_category.errors.full_messages }, status: :bad_request
        end
    end
    
    

    private
    def sub_category_params
        params.require(:sub_category).permit(:name, :image)
    end
end
