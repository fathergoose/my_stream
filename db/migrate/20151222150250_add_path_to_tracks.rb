class AddPathToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :path, :string
  end
end
