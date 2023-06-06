module BlogHelper

    def loadAllBlog
        # Logic to fetch the list of all blogs
        Blog.order(created_at: :desc)
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
    def associations_to_include
        associations = {
          'cat' => :category,
          'user' => :user,
          'subCat' => :sub_category
        }
        @vars.map { |var| associations[var] }.compact
      end

end
