class CreateConfigurationBook < ActiveRecord::Migration[5.1]
  def change
    create_table :configuration_books do |t|
      t.datetime :last_availability_request_sent_at
    end
  end
end
