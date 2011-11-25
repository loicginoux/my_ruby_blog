class AddUserToComments < ActiveRecord::Migration
  def up
    change_table :comments do |t|
      t.references :user
      t.index :user_id
    end
  end

  def down
    change_table :comments do |t|
      t.remove :user
      t.index :user_id
    end
    remove_index :comments, :user_id
  end
  
end
