class AddResetToWaiting < ActiveRecord::Migration[5.0]
  def change
    add_column :waitings, :reset_time, :string
  end
end
