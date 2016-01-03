class AddContentTypeAndSizeToTrack < ActiveRecord::Migration
  def change
    add_column :tracks, :file_size, :integer
    add_column :tracks, :file_format, :string
  end
end
