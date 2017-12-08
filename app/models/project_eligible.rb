class ProjectEligible < ApplicationRecord
  belongs_to :project
  belongs_to :eligible
end
