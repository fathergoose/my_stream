# == Schema Information
#
# Table name: tracks
#
#  id           :integer          not null, primary key
#  title        :string
#  artist_id    :integer
#  album_id     :integer
#  year         :integer
#  track_number :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  path         :string
#

class Track < ActiveRecord::Base
  mount_uploader :path, PathUploader

  belongs_to :user

  #has_many :track_albums
  #has_many :albums, through: :track_albums
  belongs_to :album 

  has_many :track_artists
  has_many :artists, through: :track_artists
  
  has_many :playlist_tracks
  has_many :playlists, through: :playlist_tracks


  def self.user_tracks(user_id)
    where user_id: user_id
  end

  require 'audioinfo'

  def save_tags!(track_id, current_user)

    AudioInfo.open('public'+path.to_s) do |info|
      @artist = Artist.where(name: info.artist, user_id: current_user.id).take
      if(@artist)
        TrackArtist.create(artist_id: @artist.id, track_id: track_id)
      else
        @artist = Artist.create(name: info.artist, user_id: current_user.id)
        TrackArtist.create(artist_id: @artist.id, track_id: track_id)
      end
      @album = Album.where(title: info.album, user_id: current_user.id).take
      unless @album
        @album = Album.create(title: info.album, user_id: current_user.id)
        AlbumArtist.create(artist_id: @artist.id, album_id: @album.id)
      end

      update(
        title: info.title,
        track_number: info.tracknum,
        album_id: @album.id,
        user_id: current_user.id
      )
    end
  end

  before_save :update_track_attributes

  private

  def update_track_attributes
    if path.present? && path_changed?
      self.file_format = path.content_type
      self.file_size = path.file.size
    end
  end
  
  


     
end
