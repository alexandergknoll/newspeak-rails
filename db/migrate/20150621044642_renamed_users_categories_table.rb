class RenamedUsersCategoriesTable < ActiveRecord::Migration
  def change
    rename_table :users_categories, :interests
  end
end
