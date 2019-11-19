class CreateSubPitches < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_pitches do |t|
      t.varchar :name
      t.nvarchar :description
      t.int :status
      t.references :pitch, null: false, foreign_key: true
      t.decimal :price_per_hour
      t.string :currency
      t.text :avatar
      t.string :size
      t.references :pitch_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
