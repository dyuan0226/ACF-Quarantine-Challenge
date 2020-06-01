class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.string :name
      t.text :description
      t.string :category
      t.integer :num_points

      t.timestamps
    end
  end
end
