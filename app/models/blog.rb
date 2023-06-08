class Blog < ApplicationRecord
    validates :title, presence: true, length: { minimum:5, maximum:40 }
    validates :body, presence: true, length: { minimum:10, maximum:1500 }
    belongs_to :user

    belongs_to :category, class_name: 'Category'
    
    belongs_to :sub_category, class_name: 'SubCategory'
end
