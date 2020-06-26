class CreateSubmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :submissions do |t|
      t.references :challenge, foreign_key: true
      t.references :user, foreign_key: true
      t.date :date_completed

      t.timestamps
    end
  end
end
