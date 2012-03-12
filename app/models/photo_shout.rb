class PhotoShout < ActiveRecord::Base
  has_attached_file :photo
  has_one :shout, as: :medium
end
