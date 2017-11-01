class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :link
      t.date :expiration
      t.references :category, foreign_key: true
      t.references :fondation, foreign_key: true

      t.timestamps
    end
  end
end
