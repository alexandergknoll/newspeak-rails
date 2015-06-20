class AddUniquenessToPhone < ActiveRecord::Migration
  def change
    change_column :users, :phone, :string, unique: true
  end
end
