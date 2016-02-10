class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.string :content, null: false
    	t.integer :user_id, null: false
    	t.integer :postquote_id, null: false
    	t.integer :upvotes
    	t.timestamps null: false
    end
  end
end
