class AddUserToPosts < ActiveRecord::Migration
  def up
    change_table :posts do |t|
      t.references :user
      t.index :user_id
    end
  end

  def down
    change_table :posts do |t|
      t.remove :user
      t.index :user_id
    end
    remove_index :posts, :user_id
  end
end
