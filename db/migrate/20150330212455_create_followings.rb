class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.references :user, index: true
      t.references :followed, index: true

      t.timestamps null: false
    end
    add_foreign_key :followings, :users
  end
end
