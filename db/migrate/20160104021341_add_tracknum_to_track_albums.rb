class AddTracknumToTrackAlbums < ActiveRecord::Migration
  def change
    add_column :track_albums, :tracknum, :integer
  end
end
