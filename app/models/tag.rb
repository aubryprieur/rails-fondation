class Tag < ApplicationRecord
  has_many :taggins
  has_many :projects, through: :taggings
end
