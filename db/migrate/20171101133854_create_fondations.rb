class CreateFondations < ActiveRecord::Migration[5.1]
  def change
    create_table :fondations do |t|
      t.string :title

      t.timestamps
    end
  end
end
