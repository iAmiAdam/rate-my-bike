class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.string :make
      t.string :model
      t.string :name
      t.text :description
      t.integer :category
      t.integer :user_id

      t.timestamps
    end
  end
end
