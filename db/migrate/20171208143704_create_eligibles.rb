class CreateEligibles < ActiveRecord::Migration[5.1]
  def change
    create_table :eligibles do |t|
      t.string :name

      t.timestamps
    end
  end
end
