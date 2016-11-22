class AddTimeoldToTimetable < ActiveRecord::Migration[5.0]
  def change
    add_column :timetables, :timeold, :text
  end
end
