class CreatePitches < ActiveRecord::Migration[6.0]
  def change
    create_table :pitches do |t|
      t.references :owner, null: false, foreign_key: true
      t.nvarchar :name
      t.nvarchar :description
      t.nvarchar :country
      t.nvarchar :city
      t.nvarchar :district
      t.string :address
      t.string :phone
      t.text :avatar

      t.timestamps
    end
  end
end
