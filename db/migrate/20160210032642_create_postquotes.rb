class CreatePostquotes < ActiveRecord::Migration
  def change
    create_table :postquotes do |t|
    	t.string :title, null: false
    	t.string :content
    	t.integer :user_id, null: false
    	t.integer :upvotes
    	t.timestamps null: false
    end
  end
end
