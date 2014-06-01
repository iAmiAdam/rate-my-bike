class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :user_id
      t.string :bike_id
      t.string :file_name

      t.timestamps
    end
  end
end
