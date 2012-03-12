class Shout < ActiveRecord::Base
  belongs_to :user

  def current

  end
  def self.current
    order("created_at DESC")
  end
end
