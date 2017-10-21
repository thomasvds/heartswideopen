class CreateSlot < ActiveRecord::Migration[5.1]
  def change
    create_table :slots do |t|
      t.boolean :available, default: true
      t.boolean :selected, default: false
      t.datetime :date
      t.references :volunteer, foreign_key: true
      t.text :comments
    end
  end
end
