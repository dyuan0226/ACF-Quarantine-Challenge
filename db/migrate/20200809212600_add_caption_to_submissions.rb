class AddCaptionToSubmissions < ActiveRecord::Migration[5.2]
  def change
    add_column :submissions, :caption, :string
  end
end
