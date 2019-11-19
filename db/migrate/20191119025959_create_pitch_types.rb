class CreatePitchTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :pitch_types do |t|
      t.varchar :name
      t.nvarchar :description

      t.timestamps
    end
  end
end
