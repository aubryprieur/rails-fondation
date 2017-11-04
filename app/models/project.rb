class Project < ApplicationRecord
  belongs_to :category
  belongs_to :fondation
  has_many :taggins
  has_many :tags, through: :taggins
end
