class CreateBands < ActiveRecord::Migration[5.1]
  def change
    create_table :bands do |t|
      t.string :name
      t.integer :event_count

      t.timestamps
    end
  end
end
