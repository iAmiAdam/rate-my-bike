class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :remember_token
      t.string :avatar
      t.boolean :admin
      t.text :bio
      t.string :avatar
      t.timestamps
    end
  end
end
