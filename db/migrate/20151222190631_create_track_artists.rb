class CreateTrackArtists < ActiveRecord::Migration
  def change
    create_table :track_artists do |t|
      t.integer :artist_id
      t.integer :track_id

      t.timestamps null: false
    end
  end
end
