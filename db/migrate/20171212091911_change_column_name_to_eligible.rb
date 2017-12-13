class ChangeColumnNameToEligible < ActiveRecord::Migration[5.1]
  def change
    rename_column :eligibles, :name, :title
  end
end
