class Project < ApplicationRecord
  after_create :send_newproject_email

  belongs_to :category
  belongs_to :fondation
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :project_eligibles
  has_many :eligibles, through: :project_eligibles

  # recherche texte des appels à projet
  include PgSearch
  pg_search_scope :search_by_description,
    against: [ :description, :title ],
    using: {
      tsearch: { prefix: true,
                dictionary: "french",
                any_word: true
                },
      trigram: { threshold: 0.1 },
      dmetaphone: {}
            },
    :ignoring => :accents

  # def all_tags=(names)
  # self.tags = names.split(",").map do |name|
  #     Tag.where(name: name.strip).first_or_create!
  #   end
  # end

  # def all_tags
  #   self.tags.map(&:name).join(", ")
  # end

  # def self.tagged_with(name)
  #   Tag.find_by_name!(name).projects
  # end


  private

  def send_newproject_email
    ProjectMailer.newproject(self).deliver_now
  end

end
