class PhotoShout < ActiveRecord::Base
  has_attached_file :photo, styles: {
    thumb: "120x120"
  }
  has_one :shout, as: :medium
end
