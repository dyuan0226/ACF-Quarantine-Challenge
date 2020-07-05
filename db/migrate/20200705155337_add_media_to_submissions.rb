class AddMediaToSubmissions < ActiveRecord::Migration[5.2]
  def change
    add_column :submissions, :media_url, :string
    add_column :submissions, :caption, :text
    add_column :submissions, :media_type, :string
  end
end
