class CreateReblogs < ActiveRecord::Migration[5.2]
  def change
    create_table :reblogs do |t|
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
    add_index :reblogs, :user_id
    add_index :reblogs, :post_id
    add_index :reblogs, [:user_id, :post_id], unique: true
  end
end
