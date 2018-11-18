class Eligible < ApplicationRecord
  has_many :project_eligibles
  has_many :projects, through: :project_eligibles
  has_many :publications
end
