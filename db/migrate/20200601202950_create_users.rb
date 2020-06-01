class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.references :team, foreign_key: true
      t.string :username
      t.string :password_digest
      t.string :role
      t.string :email
      t.boolean :active

      t.timestamps
    end
  end
end
