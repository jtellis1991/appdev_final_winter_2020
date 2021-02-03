class Category < ApplicationRecord
  has_many :subcategories, class_name: "Category",
                           foreign_key: "supercategory_id"

  belongs_to :supercategory, class_name: "Category", optional: true
  
  
end
