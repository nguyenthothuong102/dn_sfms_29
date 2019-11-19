class CreateScheduleSubpitches < ActiveRecord::Migration[6.0]
  def change
    create_table :schedule_subpitches do |t|
      t.references :schedule, null: false, foreign_key: true
      t.references :subpitch, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
