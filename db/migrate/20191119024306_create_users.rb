class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.varchar :avatar
      t.boolean :activated
      t.string :activated_digest
      t.datetime :activated_at
      t.string :email
      t.string :full_name
      t.boolean :gender
      t.string :phone
      t.string :password_digest
      t.string :reset_digest
      t.integer :role
      t.datetime :reset_sent_at
      t.string :remember_digest

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
