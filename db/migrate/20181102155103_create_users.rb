class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :avatar, default: "default_user.jpeg"
      t.string :password_digest
      t.boolean :admin, default: false

      t.timestamps
    end

    add_index :users, %i(username), unique: true
  end
end
