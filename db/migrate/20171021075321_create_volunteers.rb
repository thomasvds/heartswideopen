class CreateVolunteers < ActiveRecord::Migration[5.1]
  def change
    create_table :volunteers do |t|
      t.string :nickname
      t.string :email
      t.string :mobile_phone_number
      t.integer :number_of_beds, default: 1
      t.boolean :active, default: true
      t.datetime :last_queried_at
      t.boolean :can_be_driver, default: false
      t.boolean :available_mon, default: false
      t.boolean :available_tue, default: false
      t.boolean :available_wed, default: false
      t.boolean :available_thu, default: false
      t.boolean :available_fri, default: false
      t.boolean :available_sat, default: false
      t.boolean :available_sun, default: false
      t.text :comments
      t.string :address
      t.float :latitude
      t.float :longitude
    end
  end
end
