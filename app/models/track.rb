class Track < ActiveRecord::Base
  mount_uploader :path, PathUploader
end
