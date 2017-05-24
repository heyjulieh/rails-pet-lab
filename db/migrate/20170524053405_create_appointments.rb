class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.string :veterinarian
      t.datetime :time
      t.string :reason

      t.timestamps
    end
  end
end
