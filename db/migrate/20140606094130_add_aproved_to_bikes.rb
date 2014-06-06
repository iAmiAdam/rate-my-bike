class AddAprovedToBikes < ActiveRecord::Migration
  def change
  	add_column :bikes, :approved, :boolean, default: false
  end
end
