class Category < ApplicationRecord
  has_many :projects
  has_many :publications
end
