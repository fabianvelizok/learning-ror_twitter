class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user, index: true
      t.references :tweet, index: true

      t.timestamps null: true
    end
    add_foreign_key :likes, :users
    add_foreign_key :likes, :tweets
  end
end
