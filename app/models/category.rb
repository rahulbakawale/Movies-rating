class Category < ApplicationRecord
  has_many :movies , through: :movies_categores
  has_many :movies_categories, dependent: :destroy
end
