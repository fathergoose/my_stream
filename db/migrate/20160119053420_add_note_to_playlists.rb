class AddNoteToPlaylists < ActiveRecord::Migration
  def change
    add_column :playlists, :notes, :text
  end
end
