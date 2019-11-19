class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.references :pitch, null: false, foreign_key: true
      t.nvarchar :name
      t.nvarchar :description
      t.text :avatar
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
