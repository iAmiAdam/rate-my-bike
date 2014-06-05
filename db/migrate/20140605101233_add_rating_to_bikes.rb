class AddRatingToBikes < ActiveRecord::Migration
  def change
  	add_column :bikes, :rating, :decimal, precision: 3, scale: 2
  end
end
