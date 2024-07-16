class AddImageUrlToCompetitions < ActiveRecord::Migration[7.1]
  def change
    add_column :competitions, :image_url, :string
  end
end
