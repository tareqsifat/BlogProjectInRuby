class SubCategory < ApplicationRecord
    belongs_to :categories, class_name: "Category",

    has_many :blogs
end
