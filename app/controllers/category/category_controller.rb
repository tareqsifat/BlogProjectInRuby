class Category::CategoryController < ApplicationController

    def index
        categories = Category.all
        if categories.length != 0 then
            render json: ["data"=>categories], status: :ok
        else
            render json: ["Message"=>"there is no category"], status: :ok
        end
    end
    


end
