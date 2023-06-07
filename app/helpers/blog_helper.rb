module BlogHelper

    def loadAllBlog
         # Assuming 'vars' is passed as a parameter (e.g., vars=cat,user,subCat)
        # if(vars.key?("category"))
        #     var = true
        # end
        blog = Blog.order(created_at: :desc)
        #  Other logic for the index action
        relationalBlogData = associations_to_include(relations, blog)
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

    def associations_to_include(relations, blog)
        associations = []

        relations.each do |relation|
            associations.push(relation.to_sym)
        end

        # if vars.key?("category")
        #     associations.push("category".to_sym)
        # end
        # if vars.key?("sub_category")
        #     associations.push("sub_category".to_sym)
        # end
        # if vars.key?("user")
        #     associations.push("user".to_sym)
        # end
      blogInclude = blog.includes(associations)

      blogwithRelation = blogInclude.as_json(include: associations)
    
    end

end
