class Album < ActiveRecord::Base
  validates :name, presence: true

  has_many :tracks

  belongs_to :band, 
  dependent: :destroy
end
