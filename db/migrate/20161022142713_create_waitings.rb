class CreateWaitings < ActiveRecord::Migration[5.0]
  def change
    create_table :waitings do |t|
      t.integer :number_waiting

      t.timestamps
    end
  end
end
