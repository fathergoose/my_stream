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
end
