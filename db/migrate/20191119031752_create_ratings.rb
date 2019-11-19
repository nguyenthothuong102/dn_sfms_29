class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :subpitch, null: false, foreign_key: true
      t.integer :star
      t.text :content

      t.timestamps
    end
  end
end
