class Category < ApplicationRecord
    has_many :blogs

    has_many :sub_categories, class_name: 'SubCategory'
end
