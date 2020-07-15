class AddColToArtworks < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :favorite_artworks, :shared_artworks

  end
end
