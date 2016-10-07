class Track < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :album,
  dependent: :destroy

  # belongs_to :band,
  #   through: :album,
  #   source: :band
end
