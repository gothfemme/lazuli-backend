class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :avatar, default: "https://firebasestorage.googleapis.com/v0/b/lazuli-d0e49.appspot.com/o/images%2Fdefault_user.jpeg?alt=media&token=84c71201-66f9-404c-943f-43eabc7be3c9"
      t.string :password_digest
      t.boolean :admin, default: false

      t.timestamps
    end

    add_index :users, %i(username), unique: true
  end
end
