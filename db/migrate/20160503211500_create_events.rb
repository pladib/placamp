class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.text :description
      t.integer :maximum_quantity

      t.timestamps
    end
  end
end
