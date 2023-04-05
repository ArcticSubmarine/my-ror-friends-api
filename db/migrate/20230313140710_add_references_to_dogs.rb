class AddReferencesToDogs < ActiveRecord::Migration[7.0]
  def change
    add_reference :dogs, :friend, null: false, foreign_key: true
  end
end
