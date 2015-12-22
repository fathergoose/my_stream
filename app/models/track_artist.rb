# == Schema Information
#
# Table name: track_artists
#
#  id         :integer          not null, primary key
#  artist_id  :integer
#  track_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TrackArtist < ActiveRecord::Base
end
