class CreateTimetables < ActiveRecord::Migration[5.0]
  def change
    create_table :timetables do |t|
      t.text :time

      t.timestamps
    end
  end
end
