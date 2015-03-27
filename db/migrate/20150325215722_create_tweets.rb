class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.attachment :image
      t.text :body
      t.references :user, index: true

      t.timestamps
    end
    add_foreign_key :tweets, :users, on_delete: :cascade
  end
end
