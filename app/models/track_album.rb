# == Schema Information
#
# Table name: track_albums
#
#  id         :integer          not null, primary key
#  album_id   :integer
#  track_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TrackAlbum < ActiveRecord::Base
  belongs_to :track
  belongs_to :album
end
