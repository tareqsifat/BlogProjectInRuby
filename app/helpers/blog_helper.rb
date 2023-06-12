module BlogHelper

    def loadAllBlog
        perameter = params
        relations = ["category", "sub_category", "user"]
        blog = Blog.order(created_at: :desc)
        #  Other logic for the index action
        relationalBlogData = associations_to_include(perameter, relations, blog)
    end


    def createNewBlog
        blog = Blog.new(blog_params)
        blog.slug = blog_params[:title].parameterize
        if blog.save
            render json: { message: "blog created successfully." }, status: :created
        else
            render json: { errors: blog.errors.full_messages }, status: :bad_request
        end
        
    end

    def singleBlog
        perameter = params
        relations = ["category", "sub_category", "user"]

        blog = Blog.find(params[:id])

        relationalBlogData = associations_to_include(perameter, relations, blog)
        return relationalBlogData
    end
    

    def updateExistingBlog
        @blog = Blog.find(params[:id])

        if @blog.update(blog_params)
            render json: { message: "blog Updated successfully." }, status: :created
        else
            render json: { errors: blog.errors.full_messages }, status: :bad_request
        end
    end

    def deleteExistingBlog
        blog = Blog.find(params[:id])
        if blog.destroy
            render json: { message: 'Blog was successfully deleted.' }, status: :created 
        else
            render json: { message: 'Something went wrong' }, status: :indernal_server_error 
        end
    end
    
    

    def blog_params
        params.require(:blog).permit(
            :user_id, 
            :category_id, 
            :sub_category_id, 
            :title, 
            :slug, 
            :body 
        )
    end

    private

    def associations_to_include(params, relations, blog)
        
        params_keys = Set.new
        associations = []

        params.each do |key, value|
            params_keys.add(key)
        end

        associations = relations.select{
            |key| 
            params_keys.include?(key)
        }
        
        #   blogInclude = blog.includes(associations)

      blogwithRelation = blog.as_json(include: associations)
    
    end

end
