class Publication < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :eligible
end
