class AddColorsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :color_id, :integer
  end
end
