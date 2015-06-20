class CreateHeadlines < ActiveRecord::Migration
  def change
    create_table :headlines do |t|
      t.string :title
      t.string :abstract
      t.string :url

      t.timestamps null: false
    end
  end
end
