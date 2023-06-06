class Category < ApplicationRecord
    # has_one_attached :image
  
    validates :name, presence: true, length: { minimum: 3, maximum: 40 }, format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters and spaces" }

    # validate :validate_image_file_size
  
    private
  
    # def validate_image_file_size
    #   if image.attached? && image.blob.byte_size > 1.megabyte
    #     errors.add(:image, "should be less than 1MB")
    #   end
    # end

    has_many :blogs

    has_many :sub_categories, class_name: 'SubCategory'
end
