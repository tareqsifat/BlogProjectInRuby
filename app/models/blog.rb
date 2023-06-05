class Blog < ApplicationRecord
    belongs_to :user

    belongs_to :categories, class_name: "category"
    
    belongs_to :sub_categories, class_name: "SubCategory"
end
