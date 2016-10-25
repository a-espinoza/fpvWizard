class CreatePilots < ActiveRecord::Migration[5.0]
  def change
    create_table :pilots do |t|
      t.string :name
      t.string :last_name
      t.string :polarization
      t.string :name_of_aircraft

      t.timestamps
    end
  end
end
