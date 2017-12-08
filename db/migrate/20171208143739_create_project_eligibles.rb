class CreateProjectEligibles < ActiveRecord::Migration[5.1]
  def change
    create_table :project_eligibles do |t|
      t.references :project, foreign_key: true
      t.references :eligible, foreign_key: true

      t.timestamps
    end
  end
end
