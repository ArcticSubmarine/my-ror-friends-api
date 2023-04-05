class CreateHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.string :type
      t.string :enum[appartment,house]
      t.string :city

      t.timestamps
    end
  end
end
