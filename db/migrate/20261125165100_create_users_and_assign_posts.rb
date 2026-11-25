class CreateUsersAndAssignPosts < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
    add_index :users, "LOWER(email)", unique: true

    add_reference :posts, :user, foreign_key: true
  end
end
